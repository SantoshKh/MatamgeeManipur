<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,javax.servlet.*,javax.servlet.http.*,database_connection.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Group</title>
<link href="my_styles.css" type="text/css" rel="stylesheet" />
<!-- Java Script Part-->
<script>
function show_signup(){	
if(document.getElementById("div_su").style.display==="block")
	document.getElementById("div_su").style.display="none";
	else
	document.getElementById("div_su").style.display="block";
	}
function checkLogin(){
	if(document.getElementById("uid").value.trim(" ")===""){
	alert("Please enter Id");
	return false;
	}
	if(document.getElementById("upass").value.trim(" ")===""){
	alert("Please enter Password");
	return false;
	}
	return true;
	}	
	
//--autocomplete-->
function check_captcha(){ 
var cnd=document.getElementById("captcha_tf").value;
var random_v=document.getElementById("random").value;
	cnd=cnd+"_"+random_v;//alert(cnd);
var div_inner="";
var getStr=0;
var strArray;
var xmlhttp0;
//alert("----"+cnd);
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp0=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp0=new ActiveXObject("Microsoft.XMLHTTP");
  }//alert(xmlhttp0.readyState+"----"+cnd);
xmlhttp0.onreadystatechange=function()	
  {//alert(xmlhttp0.status);
  if (xmlhttp0.readyState==4 && xmlhttp0.status==200)
    {
    getStr=xmlhttp0.responseText;
	strArray=getStr.split("^>"); 
	if(strArray[1].trim(" ")=="not found"){
		alert("Enter correct captcha value.");
		document.getElementById("captcha_tf").value="";
		}
	
  	}
  }
xmlhttp0.open("GET","check_captcha.jsp?cnd="+cnd,true);
xmlhttp0.send();

}
<!--autocomplete-->

function check_fields(){
	if(document.getElementById("uname").value==""){
		alert("Please enter name");
		return false;
		}
	if(document.getElementById("email").value==""){
		alert("Please enter email");
		return false;
		}
	
	if(document.getElementById("captcha_tf").value==""){
		alert("Please enter captcha image");
		return false;
		}
	if(document.getElementById("pwd1").value==""){
		alert("Please enter Password");
		return false;
		}
	if(document.getElementById("pwd2").value==""){
		alert("Please enter Confirm Password");
		return false;
		}
                else{
			if(document.getElementById("pwd2").value!=document.getElementById("pwd1").value){
				alert("password and Confirm Password do not match.");
				return false;
				}
			}
		
		return true;
	}
</script>
</head>

<body bgcolor="#33CCCC">
<div style="position: absolute; top: 19px; left: 146px;"><img style="border-radius:10px;" src="images/header_images.jpg" width="1050" height="280" align="center"></div>
<span style="position: absolute; top: 427px; left: 274px;">
<%
if(session.getAttribute("u_id")==null){
%>
</span>

<div style="position: absolute; top: 343px; left: 317px;">
  <input class="my_button" type="button" name="sign" value="Sign Up" id="sign2" onclick="show_signup();" />
<% } %> 
</div>

<div id="div_si" style="position: absolute; display: block; top: 341px; left: 647px;">
<%
if(session.getAttribute("u_id")==null){
%>
<form action="" method="post" onsubmit="return checkLogin();">
<table>
<tr><td class="tf_label">Email ID:*<input type="text" name="uid" id="uid" /> </td>
<td class="tf_label">Password:*  <input type="password" name="upass" id="upass" /></td><td><input class="my_button" type="submit" value="Sign In" name="SignIn" /></td>
</tr>
</table>
</form>
<% } %>
<%
String captcha="";
MyConnection mycon=new MyConnection();
Connection con=mycon.conDB();
int random=0;
if(con==null){out.println("Database connection failed!");	}
		else	{
			//get captcha value from database
			double drandom=Math.random();
			drandom=drandom*10;
			random=(int)drandom;
			session.setAttribute("captcha_sl_no",random);
			//out.print(random);
			Statement st0=con.createStatement();
			ResultSet rs0=st0.executeQuery("select captcha from captcha where sl_no='"+random+"'");
			while(rs0.next()){
			captcha=rs0.getString(1);	
			}
						
			
if(request.getParameter("SignIn")!=null){	
String uid=request.getParameter("uid");
String upass=request.getParameter("upass");
//out.println(uid+" ,111, "+upass);
Class.forName("com.mysql.jdbc.Driver");
//Connection con=DriverManager.getConnection("jdbc:mysql://localhost/socialnetwork","root","root");

Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select Email,Password,p_image from users");
int s_f=0; String p_image="";
while(rs.next()){
	if(rs.getString("Email").equals(uid) && rs.getString("Password").equals(upass)){
            //out.println(rs.getString("Email")+",,,,"+rs.getString("Password"));
	s_f=1; p_image=rs.getString("p_image");
	break;
	}
}
	//Redirecting after sign In
	if(s_f==1){
            session.setAttribute("u_id", uid);
            session.setAttribute("p_image", p_image);
            if(uid.equals("admin"))
                response.sendRedirect("admin_home.jsp");
                else
	response.sendRedirect("main.jsp");
        }
	else
	out.println("<font color='red' style='bold'>LogIn Failed</font>");
		
	}
	}//else
%>
</div>


<!--------------------------Sign Up Form part-------------------------------------->


<div id="div_su" style="position: absolute; display: none; top: 395px; left: 137px; width: 411px;">
<form action="SignUp.jsp" method="post" onsubmit="return check_fields();">
  <table width="411" border="1">
  <tr>
    <td width="143" class="tf_label">Name:*</td>
    <td width="252"><input type="text" class="tf" name="uname" id="uname"/></td>
  </tr>
  <tr>
    <td class="tf_label">Address:</td>
    <td><textarea name="address" rows="3" cols="25"></textarea></td>
  </tr>
  <tr>
    <td class="tf_label">Gender:</td>
    <td><input type="radio" name="gender" value="m" id="male" />
      Male
      <input type="radio" name="gender" value="f" id="female" />
      Female
    </tr>
  <tr>
    <td class="tf_label">Email:*</td>
    <td><input type="email" class="tf" name="email" id="email"/></td>
  </tr>
  <tr>
    <td class="tf_label">Mobile:</td>
    <td><input type="text" class="tf" name="phn" id="phone" value="0" maxlength="10"/></td>
  </tr>
  <tr>
  <td class="tf_label">DOB:</td>
    <td><input name="date" type="date" class="tf" id="date" value="0000-00-00" />(yyyy-mm-dd)</td>
  </tr>
  <tr>
   <td class="tf_label">Enter the text in the adjacent image *</td><td><div id="captcha_div" style=" width:100px; height:50px; background-image:url(images/captcha_bg.png)" align="center"><font size="+2"><i><%=captcha%></i></font></div><br><input type="hidden" id="random" name="random" value="<%=random%>"><input type="text" name="captcha_tf" id="captcha_tf" onblur="check_captcha()"></td>
  </tr>
  <tr>
    <td class="tf_label">Password:*</td>
    <td><input type="password" class="tf" name="pwd1" id="pwd1" /></td>
  </tr>
  <tr>
    <td class="tf_label">Confirm:*</td>
    <td><input type="password" class="tf" name="pwd2" id="pwd2" /></td>
  </tr>
 
  
  <tr>
    <td>&nbsp;</td>
    <td><input class="my_button" type="submit" value="Sign Up" /></td>
  </tr>
</table>
</form>
</div>
<div style="position: absolute; top: 437px; left: 550px;">
<font color="#FFFFFF"; size="+2"><i>
* Please Sign In to continue to Social Network.<br>
* If you don't have an Id, please Sign Up. 
</i></font>
</div>
</body>
</html>