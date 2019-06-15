package xyz.zzz989.my.blog.commons.utils;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

/**
 * @author zjr
 */
public class EmailSendUtils extends Thread{

    private Email email;
    public EmailSendUtils(String subject, String msg, String... to){
        this.email = new SimpleEmail();
        email.setHostName("smtp.qq.com");
        email.setSmtpPort(465);
        email.setAuthenticator(new DefaultAuthenticator("1440629746@qq.com", "vxmfhnzvvfwefejd"));
        email.setSSLOnConnect(true);
        try {
            email.setFrom("1440629746@qq.com");
            email.setSubject(subject);
            email.setMsg(msg);
            email.addTo(to);
        } catch (EmailException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void run() {
        try {
            email.send();
        } catch (EmailException e) {
            e.printStackTrace();
        }
    }
}
