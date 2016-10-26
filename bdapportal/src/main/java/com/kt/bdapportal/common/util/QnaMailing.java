package com.kt.bdapportal.common.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import com.kt.bdapportal.common.util.auth.NdapAuthentication;

public class QnaMailing {
    private String smtpHost = "ndap.smtp.host";

	public QnaMailing() {
		Properties props = new Properties();
		try{
			props.load(NdapAuthentication.class.getClassLoader().getResourceAsStream("/ndap.properties"));
        }
        catch(Exception e){
        }
        if(props != null){
        	smtpHost = props.getProperty(smtpHost);
        }
	}
	public String replaceString(String exp, String pattern, String rep){
		if(exp==null||exp.equals("")){ return "";}
		int s=0;
		int e=0;
		StringBuffer result = new StringBuffer();
		while((e=exp.indexOf(pattern,s))>=0){
			result.append(exp.substring(s, e));
			result.append(rep);
			s=e+pattern.length();
		}
		result.append(exp.substring(s));
		return result.toString();
	}
	public String replaceHtml(String exp){
		if(exp==null|exp.equals("")){return "";}
		String result = replaceString(exp, "&amp;", "&");
		result = replaceString(result, "&quot;","\"");
		result = replaceString(result, "&#039;"," ' ");
		result = replaceString(result, "&lt;;","<");
		result = replaceString(result, "&gt;;",">");
		result = replaceString(result, "<br/>;","&nbsp;&nbsp;&nbsp;&nbsp;");
		result = replaceString(result, "<br/>;","\n");
		return result;
	}
	public Map<String,String> makeContents(List<String> recipientList, String qaTitle, String qaContent, char status){
		Map hm = new HashMap<String,String>();
		hm.put("server", smtpHost);
		hm.put("fromAddress", "bdap@kt.com");
		hm.put("fromName", "BDAP 포탈 관리자");
		hm.put("recipientList", recipientList);
		StringBuffer subject =  new StringBuffer(replaceHtml(qaTitle));
		if(status=='P'){
			subject.append(" 질문이 처리중입니다. ");
		}else if(status=='S'){
			subject.append(" 질문이 처리완료되었습니다.");
		}else if(status=='R'){
			subject.append(" 질문이 보완요청처리되었습니다. ");
		}else if(status=='N'){
			subject.append(" 질문이 등록되었습니다. ");
		}
		hm.put("subject", subject.toString());
		hm.put("content", replaceHtml(qaContent));
		return hm;
	}
	public boolean sendMail(Map hm){
		try{
			Properties props = new Properties();
			props.put("mail.smtp.host", (String)hm.get("server"));
			Session session = Session.getDefaultInstance(props,null);
			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress((String)hm.get("address"), (String)hm.get("name"), "UTF-8"));
			List<String> recipientList = (List<String>)hm.get("recipientList");
			List<Address> addressList = new ArrayList<Address>();
			for(String recipient : recipientList){
				addressList.add(new InternetAddress(recipient));
			}
			Address[] toArray = new Address[addressList.size()];
			msg.setRecipients(Message.RecipientType.TO, addressList.toArray(toArray));
			msg.setSubject(MimeUtility.encodeText((String)hm.get("subject"), "UTF-8", "B"));
			
			MimeBodyPart bodyPart = new MimeBodyPart();
			bodyPart.setContent((String)hm.get("content"),"text/html;charset=UTF-8");
			
			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(bodyPart);
			
			msg.setContent(multipart);
			msg.setSentDate(new Date());
			Transport.send(msg);
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
