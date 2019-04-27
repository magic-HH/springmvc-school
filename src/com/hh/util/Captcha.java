package com.hh.util;
import java.util.Arrays;
import java.util.List;


public class Captcha {
    public static String getCaptcha(){
        List<Character> chars = Arrays.asList('1','2','3','4','5','6','7','8','9','0','c','d','e','a','z','x','v','b','n','m','i','o','p','u','t','r','q');
        int charsLen = chars.size();
        StringBuilder captcha = new StringBuilder("");
        for(int i=0;i<4;i++){
            captcha.append(chars.get((int)(Math.random()*charsLen)));
        }
        return captcha.toString();
    }
}
