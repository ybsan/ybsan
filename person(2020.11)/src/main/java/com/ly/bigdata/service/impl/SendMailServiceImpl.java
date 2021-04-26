package com.ly.bigdata.service.impl;

import com.ly.bigdata.MailUtil;
import com.ly.bigdata.service.SendMailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class SendMailServiceImpl implements SendMailService {


    @Autowired
    JavaMailSender javaMailSender;



    @Override
    public void send(String subject, String text, String from, String[] to) {
        MailUtil.sendMail(javaMailSender,subject,text,from,to);
    }

}
