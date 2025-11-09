package com.example.reccomendation_system.helper;

import com.example.reccomendation_system.model.CityCoordinates;
import com.example.reccomendation_system.model.StateCoordinates;
import com.example.reccomendation_system.repository.CityCoordinatesJpaRepository;
import com.example.reccomendation_system.repository.StateCoordinatesJpaRepository;
import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Component;

import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Component
public class CSVFileReader {
    private final CityCoordinatesJpaRepository cityCoordinatesJpaRepository;
    private final StateCoordinatesJpaRepository stateCoordinatesJpaRepository;

    @Autowired
    public CSVFileReader(CityCoordinatesJpaRepository cityCoordinatesJpaRepository, StateCoordinatesJpaRepository stateCoordinatesJpaRepository) {
        this.cityCoordinatesJpaRepository = cityCoordinatesJpaRepository;
        this.stateCoordinatesJpaRepository = stateCoordinatesJpaRepository;
    }

    private double parseDMS(String dms) {
        dms = dms.trim();
        String regex = "(\\d+)°(\\d+)?′?(\\d+)?″?([NSEW])";
        Pattern p = Pattern.compile(regex);
        Matcher m = p.matcher(dms);

        if (!m.matches()) {
            throw new IllegalArgumentException("Invalid DMS format: " + dms);
        }

        double degrees = Double.parseDouble(m.group(1));
        double minutes = m.group(2) != null ? Double.parseDouble(m.group(2)) : 0;
        double seconds = m.group(3) != null ? Double.parseDouble(m.group(3)) : 0;
        String direction = m.group(4);

        double decimal = degrees + minutes / 60 + seconds / 3600;
        if (direction.equals("S") || direction.equals("W")) {
            decimal = -decimal;
        }

        return decimal;
    }


    public void readCityCSVFile() throws Exception {
        InputStream is = new ClassPathResource("cities.csv").getInputStream();
        CSVReader csvReader = new CSVReaderBuilder(new InputStreamReader(is))
                .withSkipLines(1)
                .build();
        List<String[]> allData = csvReader.readAll();

        for (String[] row : allData) {
            try {
                CityCoordinates cityCoordinates = new CityCoordinates();
                cityCoordinates.setCityName(row[0]);
                cityCoordinates.setLongitude(parseDMS(row[1]));
                cityCoordinates.setLatitude(parseDMS(row[2]));
                cityCoordinatesJpaRepository.save(cityCoordinates);
            } catch (Exception e) {
                System.err.println("Error parsing row: " + String.join(",", row) + " -> " + e.getMessage());
            }
        }
    }


    public void readStatesCSVFile() throws FileNotFoundException {
        try {
            InputStream is = getClass().getResourceAsStream("/indian_states.csv");
            if (is == null) throw new FileNotFoundException("indian_states.csv not found in resources");
            CSVReader csvReader = new CSVReaderBuilder(new InputStreamReader(is)).withSkipLines(1).build();
            List<String[]> allData = csvReader.readAll();
            for (String[] row : allData) {
                StateCoordinates sc = new StateCoordinates();
                sc.setStateName(row[0]);
                sc.setLatitude(Double.parseDouble(row[1]));
                sc.setLongitude(Double.parseDouble(row[2]));
                stateCoordinatesJpaRepository.save(sc);
            }
        } catch (Exception e) {
            throw new FileNotFoundException("File not found!");
        }
    }
}
