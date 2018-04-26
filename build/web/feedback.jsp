<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,javax.servlet.*,javax.servlet.http.*,database_connection.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Group</title>
</head>
<link href="my_styles.css" type="text/css" rel="stylesheet" />
<body bgcolor="#33CCCC">
<jsp:include page="head.jsp"/>
<div style="position: absolute; top: 149px; left: 222px;">
<%
if(session.getAttribute("u_id")!=null){
%>
<form action="" method="post">
<table width="349" border="1">

  <tr>
    <td class="tf_label">Feedback:</td>
    <td><textarea name="feedback" rows="3" cols="25"></textarea></td>
  </tr> 
  <tr>
    <td><input class="my_button" type="submit" value="Submit" name="Submit" /></td>
  </tr>
</table>
</form>
<% } 


if(request.getParameter("Submit")!=null){
String email=(String)session.getAttribute("u_id");
String feedback=request.getParameter("feedback");
try{
MyConnection mycon=new MyConnection();
Connection con=mycon.conDB();
if(con==null){out.println("Database connection failed!");	}
		else	{
Statement st=con.createStatement();
java.util.Date c_date=new java.util.Date();
java.sql.Date sql_date=new java.sql.Date(c_date.getTime());
int chk=st.executeUpdate("insert into feedback(email,remark,f_date) values('"+email+"','"+feedback+"','"+sql_date+"')");
if(chk==1){
	//out.print("feedback successfully saved.");
	}else{out.print("feedback save failed.");
	}
	
	st.close();
	con.close();
		}
}catch(Exception e){out.print(e);}
}


//show old feedbacks
try{
MyConnection mycon=new MyConnection();
Connection con=mycon.conDB();
if(con==null){out.println("Database connection failed!");	}
		else	{
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from feedback where email like '"+session.getAttribute("u_id")+"' order by f_date desc");
out.println("<table border='1'><tr><font color='#FFFFFF'; size='+2'><i>Previously submitted feedbacks:</i></font></tr><tr><td class='tf_label'>Date</td><td class='tf_label'>Feedback</td><td class='tf_label'>Admin Replied</td></tr>");
while(rs.next()){
	out.println("<tr><td>"+rs.getString("f_date")+"</td><td>"+rs.getString("remark")+"</td><td>"+rs.getString("admin_replied")+"</td></tr>");
	}
out.println("</table>");
	rs.close();
	st.close();
	con.close();
		}
}catch(Exception e){out.print(e);}


%>
</div>

</body>
</html>