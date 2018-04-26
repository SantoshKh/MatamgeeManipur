<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,database_connection.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Group</title>
</head>

<body bgcolor="#CCCCCC";>
    <jsp:include page="head.jsp"/>
    <div style="position: absolute; left: 200px; top: 150px;">
   <% try{
MyConnection mycon=new MyConnection();
Connection con=mycon.conDB();
if(con==null){out.println("Database connection failed!");	}
		else	{
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select p_image,Name,Address from members,users where members.main_id like '"+session.getAttribute("u_id")+"' and members.member_id=users.Email");
 //rs=st.executeQuery("select * from post_attachment where p_u_id like '"+session.getAttribute("u_id")+"'");
 out.println("<table id><tr><td><font size=10px; color=red>Friends</td></tr>");
//out.println("<td><img scr=header_images.jpg></td>")
while(rs.next()){
out.println("<div style='position:absolute; left:207px; top:363px; border:double;'><tr><td><img style='border-radius:5px;' src='images/"+rs.getString("p_image")+"' width=100 height=100></td><td>"+rs.getString("Name")+"</td></tr>");

}
out.println("</table>");
		}
		}catch(Exception e){}
%>

</body>
</html>