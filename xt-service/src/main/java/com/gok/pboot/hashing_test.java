package com.gok.pboot;


import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

public class hashing_test{
    public static void main(String[] args) {
        PasswordEncoder encoder =
                PasswordEncoderFactories.createDelegatingPasswordEncoder();

        String peika = encoder.encode("peika_password");
        String vii = encoder.encode("vii_password");

        System.out.println("Peika hash: " + peika);
        System.out.println("Vii hash: " + vii);
    }
}
