package com.gok.pboot;

import java.util.Base64;

public class Test {

    public static void main(String[] args) {
        System.out.println(EncodeUtils.md5Encode("123").toUpperCase());

        System.out.println(Base64.getEncoder().encodeToString(CryptoUtils.aesEncrypt("1815289902716944385".getBytes(), Base64.getDecoder().decode("7VwOCefYHwQv5lJWjKhlHQ=="))));
    }
}
