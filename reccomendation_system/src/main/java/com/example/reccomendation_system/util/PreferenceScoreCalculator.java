package com.example.reccomendation_system.util;

import com.example.reccomendation_system.dto.LocationDTO;
import com.example.reccomendation_system.helper.EucledianDistanceCalculator;
import com.example.reccomendation_system.dto.LocationCoordinates;
import com.example.reccomendation_system.repository.CityCoordinatesJpaRepository;
import com.example.reccomendation_system.repository.InternshipJpaRepository;
import com.example.reccomendation_system.repository.InternshipRequirementsJpaRepository;
import com.example.reccomendation_system.repository.StateCoordinatesJpaRepository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Calculates internship preference scores based on mode match and popularity.
 * A higher score indicates closer alignment with the user's preferences.
 */

@Component
public class PreferenceScoreCalculator {

    private final InternshipRequirementsJpaRepository internshipRequirementsJpaRepository;
    private final InternshipJpaRepository internshipJpaRepository;
    private final CityCoordinatesJpaRepository cityCoordinatesJpaRepository;
    private final StateCoordinatesJpaRepository stateCoordinatesJpaRepository;
    private List<Integer> eligibleInternshipIds;
    private HashMap<Integer, Double> preferenceScores;
    private EucledianDistanceCalculator eucledianDistanceCalculator;

    @Autowired
    public PreferenceScoreCalculator(InternshipRequirementsJpaRepository internshipRequirementsJpaRepository, InternshipJpaRepository internshipJpaRepository, CityCoordinatesJpaRepository cityCoordinatesJpaRepository, StateCoordinatesJpaRepository stateCoordinatesJpaRepository) {
        this.internshipRequirementsJpaRepository = internshipRequirementsJpaRepository;
        this.internshipJpaRepository = internshipJpaRepository;
        this.cityCoordinatesJpaRepository = cityCoordinatesJpaRepository;
        this.stateCoordinatesJpaRepository = stateCoordinatesJpaRepository;
    }
    public HashMap<Integer, Double> getPreferenceScores(ArrayList<Integer> internshipIds, UserRequirements userRequirements) {
        this.eligibleInternshipIds = internshipIds;
        this.preferenceScores = new HashMap<>();
        this.eucledianDistanceCalculator = new EucledianDistanceCalculator();
        // calculate preference score for mode
        if (userRequirements.getPreferredMode() != null) {
            getModePreferenceScores(userRequirements.getPreferredMode());
        }
        // calculate preference scores for applied ratios (applied_count / total_count)
        getAppliedRatioScores();
        // calculate preference scores based on location
        if (userRequirements.getPreferredMode() != null || userRequirements.getPreferredState() != null) {
            getLocationPreferenceScores(userRequirements.getPreferredCity(), userRequirements.getPreferredState());
        }
        return preferenceScores;
    }
    private void getModePreferenceScores(String preferredMode) {
        List<Object[]> modes = internshipRequirementsJpaRepository.findAllModesById(eligibleInternshipIds);
        HashMap<Integer, String> modesMap = new HashMap<>();
        for (Object[] record : modes) {
            if (record[1] != null) {
                modesMap.put(((Number) record[0]).intValue(), record[1].toString());
            }
        }

        for (int internshipId : eligibleInternshipIds) {
            double score = 0.0;
            String mode = modesMap.getOrDefault(internshipId, null);
            if (preferredMode.equalsIgnoreCase("Any") || preferredMode.equalsIgnoreCase(mode)) {
                score = 1;
            } else if ("Hybrid".equalsIgnoreCase(mode)) {
                score = 0.5;
            }
            preferenceScores.put(internshipId, score + preferenceScores.getOrDefault(internshipId, 0.0));
        }
    }
    private void getAppliedRatioScores() {
        if (eligibleInternshipIds == null || eligibleInternshipIds.isEmpty()){
            return;
        }
        List<Object[]> results = internshipJpaRepository.findMaxMinRatiosAndAppliedCounts(eligibleInternshipIds);
        if (results == null || results.isEmpty()) {
            return;
        }
        Object[] maxMinRatiosAndAppliedCounts = results.get(0);
        double maxAppliedRatio = ((Number) maxMinRatiosAndAppliedCounts[0]).doubleValue();
        double minAppliedRatio = ((Number) maxMinRatiosAndAppliedCounts[1]).doubleValue();
        int maxAppliedCount = ((Number) maxMinRatiosAndAppliedCounts[2]).intValue();
        int minAppliedCount = ((Number) maxMinRatiosAndAppliedCounts[3]).intValue();
        if (maxAppliedRatio == minAppliedRatio && maxAppliedCount == minAppliedCount) {
            return;
        }
        List<Object[]> appliedCountAndAppliedRatios = internshipJpaRepository.findAllAppliedCountsAndAppliedRatiosById(eligibleInternshipIds);
        HashMap<Integer, Double> appliedRatiosMap = new HashMap<>();
        HashMap<Integer, Integer> appliedCountsMap = new HashMap<>();

        for (Object[] record : appliedCountAndAppliedRatios) {
            int internshipId = ((Number) record[0]).intValue();
            appliedCountsMap.put(internshipId, ((Number) record[1]).intValue());
            if (record[2] != null) {
                appliedRatiosMap.put(internshipId, ((Number) record[2]).doubleValue());
            }
        }
        for (int internshipId : eligibleInternshipIds) {
            double score = 0.0;
            if (!appliedRatiosMap.containsKey(internshipId)) {
                if (maxAppliedCount != minAppliedCount) {
                    int currAppliedCount = appliedCountsMap.getOrDefault(internshipId, 0);
                    score = ((double) maxAppliedCount - currAppliedCount) / (maxAppliedCount - minAppliedCount);
                }
            }
            else if (maxAppliedRatio != minAppliedRatio) {
                double currAppliedRatio = appliedRatiosMap.get(internshipId);
                score = (maxAppliedRatio - currAppliedRatio) / (maxAppliedRatio - minAppliedRatio);
            }
            preferenceScores.put(internshipId, score + preferenceScores.getOrDefault(internshipId, 0.0));
        }
    }
    private void getLocationPreferenceScores(String preferredCity, String preferredState) {
        // get the preferred city and state coordinates
        LocationCoordinates preferredLocationCoordinates = getCityLocationCoordinates(preferredCity);
        if (preferredLocationCoordinates == null) {
            preferredLocationCoordinates = getStateLocationCoordinates(preferredState);
            if (preferredLocationCoordinates == null) {
                throw new EntityNotFoundException("The given city and state are invalid!");
            }
        }
        List<LocationDTO> internshipsCoordinates = internshipJpaRepository.findAllLocationCoordinatesById(eligibleInternshipIds);
        HashMap<Integer, Double> internshipLocationDistanceMap = new HashMap<>();
        HashMap<String, Double> locationDistanceMap = new HashMap<>();
        double maxDistance = 0, minDistance = Double.POSITIVE_INFINITY;
        for (LocationDTO locationDTO : internshipsCoordinates) {
            double targetLatitude = locationDTO.getCityLatitude() == null ? locationDTO.getStateLatitude() : locationDTO.getCityLatitude();
            double targetLongitude = locationDTO.getCityLongitude() == null ? locationDTO.getStateLongitude() : locationDTO.getCityLongitude();
            String key = locationDTO.getCityName() != null ? locationDTO.getCityName() : locationDTO.getStateName();
            if (locationDistanceMap.containsKey(key)) {
                internshipLocationDistanceMap.put(locationDTO.getInternshipId(), locationDistanceMap.get(key));
            } else {
                double distance = eucledianDistanceCalculator.calculateDistance(preferredLocationCoordinates.getLatitude(), preferredLocationCoordinates.getLongitude(), targetLatitude, targetLongitude);
                internshipLocationDistanceMap.put(locationDTO.getInternshipId(), distance);
                if (locationDTO.getCityName() != null) {
                    locationDistanceMap.put(locationDTO.getCityName(), distance);
                } else if (locationDTO.getStateName() != null) {
                    locationDistanceMap.put(locationDTO.getStateName(), distance);
                }
                maxDistance = Math.max(maxDistance, distance);
                minDistance = Math.min(minDistance, distance);
            }
        }
        if (maxDistance != minDistance) {
            for (int id : eligibleInternshipIds) {
                double distanceScore = (maxDistance - internshipLocationDistanceMap.get(id)) / (maxDistance - minDistance);
                System.out.println(distanceScore);
                preferenceScores.put(id, distanceScore + preferenceScores.getOrDefault(id, 0.0));
            }
        }
    }
    private LocationCoordinates getCityLocationCoordinates(String cityName) {
        List<LocationCoordinates> locationCoordinates = cityCoordinatesJpaRepository.findCityCoordinatesByCityName(cityName);
        if (locationCoordinates.isEmpty()) {
            return null;
        }
        return locationCoordinates.get(0);
    }

    private LocationCoordinates getStateLocationCoordinates(String stateName) {
        List<LocationCoordinates> locationCoordinates = stateCoordinatesJpaRepository.findStateCoordinatesByStateName(stateName);
        if (locationCoordinates.isEmpty()) {
            return null;
        }
        return locationCoordinates.get(0);
    }
}
