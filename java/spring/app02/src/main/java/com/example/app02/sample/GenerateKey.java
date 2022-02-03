package com.example.app02.sample;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class GenerateKey {
    private String sha256(String name) throws NoSuchAlgorithmException {

        String key = name + System.currentTimeMillis();
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(key.getBytes());

        StringBuilder builder = new StringBuilder();
        for (byte b : md.digest()) {
            builder.append(String.format("%02x", b));
        }

        return builder.toString();
    }
}
