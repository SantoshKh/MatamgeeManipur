<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.sql.*,javax.servlet.*,javax.servlet.http.*,database_connection.*" %>
<%@page import="java.util.*,javax.mail.*,javax.mail.internet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Online Chat</title>
</head>

<body>
<%
String uname=request.getParameter("uname");
String address=request.getParameter("address");
String gender=request.getParameter("gender");
String email=request.getParameter("email");
String phone=request.getParameter("phn");
String dob=request.getParameter("date");
String password=request.getParameter("pwd1");
MyConnection mycon=new MyConnection();
Connection con=mycon.conDB();
if(con==null){out.println("Database connection failed!");	}
		else	{
Statement st=con.createStatement();
//out.println("insert into users(Name,Address,Gender,Email,Mobile,DOB,Password) values('"+uname+"','"+address+"','"+gender+"','"+email+"','"+phone+"','"+dob+"','"+password+"')");
int i=st.executeUpdate("insert into users(Name,Address,Gender,Email,Mobile,DOB,Password) values('"+uname+"','"+address+"','"+gender+"','"+email+"','"+phone+"','"+dob+"','"+password+"')");
if(i==1){
out.println("Register successful");
            session.setAttribute("u_id", email);
            session.setAttribute("p_image", "");
			
			//-----------------send mail--------------------
	
	String USER_NAME = "";  // GMail user name (just the part before "@gmail.com")
     String PASSWORD = ""; // GMail password


     String RECIPIENT = email;

   // public static void main(String[] args) {
        String from = USER_NAME;
        String pass = PASSWORD;
        String[] to = { RECIPIENT }; // list of recipient email addresses
        String subject = "Registration with Social Network";
        String body = "You have successfully registered with Social Network. Your Login Id and Password are,  Id: '"+email+"'      Password: '"+password+"' . This is a system generated mail. Please do not reply.";

        Properties props = System.getProperties();
        String host = "smtp.gmail.com";
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        //Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(Session.getDefaultInstance(props));

        try {
            message.setFrom(new InternetAddress(from));
            InternetAddress[] toAddress = new InternetAddress[to.length];

            // To get the array of addresses
            for( int i1 = 0; i1 < to.length; i1++ ) {
                toAddress[i1] = new InternetAddress(to[i1]);

            }

            for( int i2 = 0; i2 < toAddress.length; i2++) {
                message.addRecipient(Message.RecipientType.TO, toAddress[i2]);
            }

            message.setSubject(subject);
            message.setText(body);
            Transport transport = Session.getDefaultInstance(props).getTransport("smtp");
            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        }
        catch (AddressException ae) {
            ae.printStackTrace();
        }
        catch (MessagingException me) {
            me.printStackTrace();
        }
	//------------------send mail---------------------------
			
response.sendRedirect("main.jsp");
}
else
out.println("Register failed");

st.close();
con.close();
		}
%>
</body>
</html>