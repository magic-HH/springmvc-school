package com.hh.util;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

public class SendMail {
    public static String senderAddress = "afra_hh@126.com";
    //    public static String recipientAddress = "1396827981@qq.com";
    //收件人账户名
    public static String senderAccount = "afra_hh@126.com";
    public static String senderPassword = "A123456789";

    public static void senddata(String sAddress, String codeData) throws Exception {
        Properties props = new Properties();
        props.setProperty("mail.smtp.auth", "true");
        props.setProperty("mail.transport.protocol", "smtp");
        props.setProperty("mail.smtp.host", "smtp.126.com");
        Session session = Session.getInstance(props);
        session.setDebug(false);
        Message msg = getMimeMessage(session,sAddress,codeData);
        Transport transport = session.getTransport();
        transport.connect(senderAccount, senderPassword);
        transport.sendMessage(msg,msg.getAllRecipients());
        transport.close();
    }
    public static void senddata(String sAddress, String codeData, String head) throws Exception {
        Properties props = new Properties();
        props.setProperty("mail.smtp.auth", "true");
        props.setProperty("mail.transport.protocol", "smtp");
        props.setProperty("mail.smtp.host", "smtp.126.com");
        Session session = Session.getInstance(props);

        session.setDebug(false);
        Message msg = getMimeMessage(session,sAddress,codeData, head);

        Transport transport = session.getTransport();
        transport.connect(senderAccount, senderPassword);
        transport.sendMessage(msg,msg.getAllRecipients());
        transport.close();
    }


    public static MimeMessage getMimeMessage(Session session, String RAddress, String codeData) throws Exception{
        MimeMessage msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(senderAddress));
        msg.setRecipient(MimeMessage.RecipientType.TO,new InternetAddress(RAddress));
        //设置邮件主题
        msg.setSubject("验证码","UTF-8");
        //设置邮件正文
        msg.setContent(codeData, "text/html;charset=UTF-8");
        //设置邮件的发送时间,默认立即发送
        msg.setSentDate(new Date());

        return msg;
    }
    public static MimeMessage getMimeMessage(Session session, String RAddress, String codeData, String head) throws Exception{
        MimeMessage msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(senderAddress));
        msg.setRecipient(MimeMessage.RecipientType.TO,new InternetAddress(RAddress));
        //设置邮件主题
        msg.setSubject(head,"UTF-8");
        //设置邮件正文
        msg.setContent(codeData, "text/html;charset=UTF-8");
        //设置邮件的发送时间,默认立即发送
        msg.setSentDate(new Date());

        return msg;
    }



}
