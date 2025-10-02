package com.example.reccomendation_system.util;

import java.util.HashMap;

public class QualificationConstants {
    public static final HashMap<String, Integer> QUALIFICATION_CONSTANTS = new HashMap<>();
    static {
        QUALIFICATION_CONSTANTS.put("PHD", 5);
        QUALIFICATION_CONSTANTS.put("PG", 4);
        QUALIFICATION_CONSTANTS.put("UG", 3);
        QUALIFICATION_CONSTANTS.put("12", 2);
        QUALIFICATION_CONSTANTS.put("10", 1);
        QUALIFICATION_CONSTANTS.put(null, 0);
    }
}
