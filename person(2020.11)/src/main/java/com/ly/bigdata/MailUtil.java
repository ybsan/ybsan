package com.ly.bigdata;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;


public class MailUtil {

public static void sendMail(
        JavaMailSender mailSender,String subject,String text,String
        from,String[] to){

    SimpleMailMessage mailMessage=new SimpleMailMessage();
    mailMessage.setSubject(subject);
    mailMessage.setText(text);
    mailMessage.setFrom(from);
    mailMessage.setTo(to);
    mailSender.send(mailMessage);
}

}
