package com.ly.bigdata;

public class GenCode {

    // 9HJFJHRSU
    private static String str="1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    public static String gen(){
        StringBuffer sb =new StringBuffer();
        // 03~5
        for (int i = 0; i <9 ; i++) {
           sb.append(str.charAt((int)Math.floor(Math.random()*36)));
        }
        return sb.toString();
    }
    
    public static void main(String args[]){
        System.out.println(GenCode.gen());
    }
}
