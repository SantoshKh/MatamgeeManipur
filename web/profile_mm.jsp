<%@page import="java.sql.DriverManager,ToMM.*"%>
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
		
	//english to meetei mayek-----------------------
	function to_mm(pid){ //alert(pid);
	//var key=event.keyCode || event.charCode;	
		org_values=document.getElementById(pid).value;//alert(org_values);
		c_char=org_values.substr(-1);//alert("("+c_char+")");
		//if(key!=8){
		final_value=eng2mmChar(c_char); //alert("["+final_value+"]");
		if(final_value==''){final_value=c_char;}
		//remove last eng char-----------
		good_part=org_values.substr(0,org_values.length-1);
		document.getElementById("test_div").value=good_part+final_value;
		//}
		//document.getElementById("uname").value=final_values;
		}
	/*function eng2mm(eng_values){//alert(eng_values.length);
	mm_values="";
		for(i=0;i<eng_values.length;i++){ //alert(eng_values.charAt(i));
			mm_values=mm_values+eng2mmChar(eng_values.charAt(i));
			}
			return mm_values;
		}*/
	function eng2mmChar(pchar){
mmarr=['\uABC0','\uABC1','\uABC2','\uABC3','\uABC4','\uABC5','\uABC6','\uABC7','\uABC8','\uABC9','\uABCA','\uABCB','\uABCC','\uABCD','\uABCE','\uABCF','\uABD0','\uABD1','\uABD2','\uABD3','\uABD4','\uABD5','\uABD6','\uABD7','\uABD8','\uABD9','\uABDA','\uABDB','\uABDC','\uABDD','\uABDE','\uABDF','\uABE0','\uABE1','\uABE2','\uABE3','\uABE4','\uABE5','\uABE6','\uABE7','\uABE8','\uABE9','\uABEA','\uABEB','\uABEC','\uABED','\uABF0','\uABF1','\uABF2','\uABF3','\uABF4','\uABF5','\uABF6','\uABF7','\uABF8','\uABF9',];

		engarr=['k','s','l','m','p','n','c','t','k','Z','T','w','y','h','U','I','f','A','g','J','r','b','j','d','G','D','v','Q','L','M','P','N','Y','H','I','0','o','i','a','e','E','u','O','q','||','.','_','1','2','3','4','5','6','7','8','9'];
		
		for(j=0;j<engarr.length;j++){//alert(engarr[j]+"="+pchar);
			if(engarr[j]==pchar){//alert(mmarr[j]);
				return mmarr[j]; 
				}
		}
		return ''; 
	}
</script>
</head>

<body bgcolor="#33CCCC">
<jsp:include page="head_mm.jsp"/>
<span style="position: absolute; left: 820px; top: 12px; height: 26px; z-index: 11">
    <a href="profile.jsp">English</a>
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
	}	//u_name="\uABC1\uABC2\uABC3";
        //create object
        ToMM tmm=new ToMM();
	//------------------------------------------
        u_name=tmm.convert2MM(u_name);
        address=tmm.convert2MM(address);
        mobile=tmm.convert2MM(mobile);
	//out.println("<br><br><br><br><br><br><br><br><br><br><br><br>");
        
	//------------------------------------------
	
	
	
%>
<div id="pp_div" style="position:absolute; top:6px; left:3px; width:200px; background-color:#CCC"><form name="image_form" action='profile_edit.jsp' method='post' enctype='multipart/form-data'>
<img src='images/<%=image%>' width=200 height=200>
<div style="position:absolute; top:160px; width:100%; height:40px; background-color:#F00; opacity:.5;" ><input id="img_btn" type="file" name="file" value="Edit Picture" onchange="show_value();">
</div>
</form></div>

<div style="position:absolute; top:6px; left:250px;"><form action="" method="post">
<table>
<tr><td class="tf_label">&#43971;&#44004;&#44001;:</td><td style='display:block' id='td_name'><%=u_name%></td><td id='tf_name' style='display:none'><input type='text' id="uname" name='uname' value="<%=u_name%>" onkeyup="to_mm(id);"><textarea id="test_div"  onkeyup="to_mm(id);"></textarea></td></tr>
<tr><td class="tf_label">&#43970;&#44009;&#43984;&#43997;:</td><td style='display:block' id='td_address'><%=address%></td><td  style='display:none' id='tf_address'><input type='text' name='uaddress' value='<%=address%>'></td></tr>
<tr><td class="tf_label">&#43984;&#44003;&#43973;.:</td><td style='display:block' id='td_mobile'><%=mobile%></td><td id='tf_mobile' style='display:none'><input type='text' name='mobile' value="<%=mobile%>"></td></tr>
<tr><td><input class="my_button" type='button' value='&#43969;&#44006;&#43997;&#43991;&#44003;&#43995;&#43972;' onClick='show_tfs();'></td><td><input class="my_button" type='submit' id='bt_submit' value='Save' name="Save" style='display:none;'></td></tr>
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