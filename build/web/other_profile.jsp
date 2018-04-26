<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.io.*,org.apache.commons.io.FileUtils,javax.servlet.*,javax.servlet.http.*,database_connection.*" errorPage="" %>
<%@ page import="org.apache.commons.io.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Group</title>

</head>

<body bgcolor="#339999">
<jsp:include page="head.jsp"/>

<div style="position: absolute; top: 207px; left: 255px;">

<%  
String pid=request.getParameter("pid");
pid=pid.trim();
//out.print("iiiiiiiiidddddddddddd="+"select * from users where email like '"+pid+"'");
//showing profile
try{
MyConnection mycon=new MyConnection();
Connection con=mycon.conDB();
if(con==null){out.println("Database connection failed!");	}
		else	{
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from users where email like '"+pid+"'");


out.println("<table>");
while(rs.next()){ String att_name=rs.getString("p_image");
	out.println("<tr><td colspan='2'><img src='images/"+att_name+"' width=200 height=150></td></tr>");
	
	out.println("<tr><td class='tf_label'>Name:  </td><td>"+rs.getString("Name")+"</td></tr><tr><td class='tf_label'>Address: </td><td>"+rs.getString("Address")+"</td></tr>");
	}
out.println("</table>");
	

%>

<div  style="position: absolute; top: 5px; left: 400px;">
<%
if(request.getParameter("sfr")!=null){
	String main_id=(String)session.getAttribute("u_id");
	String req_id=pid;
	int chk=st.executeUpdate("insert into friend_requests(main_id,request_id,status) values('"+main_id+"','"+req_id+"','initiated')");
	if(chk==1){out.println("Request successfully sent.");}
	else{out.println("Request could not be sent. Please try again.");}
	}
%>
<form action="" method="post" onsubmit="hide_tf_sfr()">
<input type="hidden" name="pid" value="<%=pid%>" />
<% 
Statement st_chk=con.createStatement();
ResultSet rs_chk=st_chk.executeQuery("select * from friend_requests where main_id like '"+session.getAttribute("u_id")+"' ");
int found=0;
while(rs_chk.next()){
	if(rs_chk.getString("request_id").equals(pid)){
	found=1; break;
	}
	}

if(!pid.equals(session.getAttribute("u_id")) && found==0){ %>
<input type="submit" name="sfr" value="Send Friend Request" /><% } %>
</form>

</div>
<%
rs.close();
	st.close();
	con.close();
		}
}catch(Exception e){out.print(e);}

%>
</div>
</body>
</html>