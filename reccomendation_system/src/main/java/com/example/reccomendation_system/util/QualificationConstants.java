package com.example.reccomendation_system.util;

import java.util.HashMap;

public class QualificationConstants {
    public static final HashMap<String, Integer> QUALIFICATION_RANKS = new HashMap<>();
    public static final HashMap<Integer, String> RANK_QUALIFICATIONS = new HashMap<>();
    static {
        QUALIFICATION_RANKS.put("PHD", 5);
        RANK_QUALIFICATIONS.put(5, "PHD");
        QUALIFICATION_RANKS.put("PG", 4);
        RANK_QUALIFICATIONS.put(4, "PG");
        QUALIFICATION_RANKS.put("UG", 3);
        RANK_QUALIFICATIONS.put(3, "UG");
        QUALIFICATION_RANKS.put("12", 2);
        RANK_QUALIFICATIONS.put(2, "12");
        QUALIFICATION_RANKS.put("10", 1);
        RANK_QUALIFICATIONS.put(1, "10");
        QUALIFICATION_RANKS.put(null, 0);
        RANK_QUALIFICATIONS.put(0, null);
    }
}
