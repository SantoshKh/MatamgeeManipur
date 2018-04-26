<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script>
<!--chat part starts-->
function sendChatMsg(){
	msg1=document.getElementById("message").value;
	msg1=msg1+"___tomba";
if (window.XMLHttpRequest)   
  {
  // code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp1=new XMLHttpRequest();
  }
else
  {
  // code for IE6, IE5
  xmlhttp1=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp1.onreadystatechange=function()	
  {alert(xmlhttp1.readyState+"      "+xmlhttp1.status);//
  if (xmlhttp1.readyState==4 && xmlhttp1.status==200)
    {
    getStr=xmlhttp1.responseText;
		getStr=getStr.trim(" ");
		alert(getStr);   
  }
  }
xmlhttp1.open("GET","chat1.jsp?msg1="+msg1,true);
xmlhttp1.send();

	}
<!--chat part ends-->
</script>
</head>

<body>
  <div>
    <form action="" method="get" onsubmit="sendChatMsg()">
    <textarea name="message" id="message"></textarea>
    <input type="submit" value="Send" />
    </form>
    </div>
</body>
</html>