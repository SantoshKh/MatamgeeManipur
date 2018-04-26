<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.io.*,org.apache.commons.io.FileUtils,javax.servlet.*,javax.servlet.http.*,database_connection.*" errorPage="" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
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
<link href="my_styles.css" type="text/css" rel="stylesheet" />

<script>
function show_tfs(){
	
	document.getElementById("bt_submit").style.display="block";
	//document.getElementById("td_image").style.display="none";
	//document.getElementById("tf_image").style.display="block";
	document.getElementById("td_name").style.display="none";
	document.getElementById("tf_name").style.display="block";
	document.getElementById("td_address").style.display="none";
	document.getElementById("tf_address").style.display="block";	
	document.getElementById("td_mobile").style.display="none";
	document.getElementById("tf_mobile").style.display="block";
	
	}
	function show_value(){
		//var img_val=document.getElementById("img_btn").value;		
		//document.getElementById("pp_div").innerHTML="<img src='images/"+img_val+"' width=200 height=160>";
		document.image_form.submit();
		}
</script>
</head>

<body bgcolor="#33CCCC">
<jsp:include page="head.jsp"/>
<span style="position: absolute; left: 820px; top: 12px; height: 26px; z-index: 11">
    <a href="profile_mm.jsp">Meetei Mayek</a>
</span>
<div style="position:absolute; display:block; top:100px; left:200px">
<%
//displaying profile edit
try{
MyConnection mycon=new MyConnection();
Connection con=mycon.conDB();
if(con==null){out.println("Database connection failed!");	}
		else	{
		/////////////////////	
			
			if(request.getParameter("Save")!=null){	
String uname=request.getParameter("uname");
String uaddress=request.getParameter("uaddress");
String umobile=request.getParameter("mobile");

Statement st0=con.createStatement();
st0.executeUpdate("update users set Name='"+uname+"', Address='"+uaddress+"',Mobile='"+umobile+"' where Email like '"+session.getAttribute("u_id")+"'");
			}
	////////////////
			
Statement st=con.createStatement();
String u_name="";
String address="";
String mobile="";
String image="";
ResultSet rs=st.executeQuery("select * from users where Email like '"+session.getAttribute("u_id")+"'");
while(rs.next()){
	u_name=rs.getString("Name");
	address=rs.getString("Address");
	mobile=rs.getString("Mobile");
	image=rs.getString("p_image");
	}	
%>
<div id="pp_div" style="position:absolute; top:6px; left:3px; width:200px; background-color:#CCC"><form name="image_form" action='profile_edit.jsp' method='post' enctype='multipart/form-data'>
<img src='images/<%=image%>' width=200 height=200>
<div style="position:absolute; top:160px; width:100%; height:40px; background-color:#F00; opacity:.5;" ><input id="img_btn" type="file" name="file" value="Edit Picture" onchange="show_value();">
</div>
</form></div>

<div style="position:absolute; top:6px; left:250px;"><form action="" method="post">
<table>
<tr><td class="tf_label">Name:</td><td style='display:block' id='td_name'><%=u_name%></td><td id='tf_name' style='display:none'><input type='text' name='uname' value="<%=u_name%>"></td></tr>
<tr><td class="tf_label">Address:</td><td style='display:block' id='td_address'><%=address%></td><td  style='display:none' id='tf_address'><input type='text' name='uaddress' value='<%=address%>'></td></tr>
<tr><td class="tf_label">Mobile No.:</td><td style='display:block' id='td_mobile'><%=mobile%></td><td id='tf_mobile' style='display:none'><input type='text' name='mobile' value="<%=mobile%>"></td></tr>
<tr><td><input class="my_button" type='button' value='EDIT' onClick='show_tfs();'></td><td><input class="my_button" type='submit' id='bt_submit' value='Save' name="Save" style='display:none;'></td></tr>
</table></form></div>

<%

	rs.close();
	st.close();
	con.close();
		}
}catch(Exception e){out.print(e);}

%>
</div>
<div></div>

</body>
</html>