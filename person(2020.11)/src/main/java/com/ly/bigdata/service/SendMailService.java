package com.ly.bigdata.service;

public interface SendMailService {

    public void send(String subject,String text,String from,String[] to);

}
