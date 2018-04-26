<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,database_connection.*" errorPage="" %>
<% if(session.getAttribute("u_id")==null){
	response.sendRedirect("index.jsp"); 
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Group</title>
<link href="my_styles.css" type="text/css" rel="stylesheet" />

<script>
function check_post(){
	if(document.getElementById("description").value==""){
		alert("Please enter your post.");
		return false;
		}
		return true;
	}
function check_comment(){
	c_pid=document.getElementById("p_id").value;alert(c_pid);
	ta_id="comment_"+c_pid;alert(ta_id);
	if(document.getElementById(ta_id).value==""){
		alert("Please enter your comment.");
		return false;
		}
		return true;
	}
function show(){
	//alert("called");
	}
//------------------------autocomplete------------------>
function search_event(){
var cnd=document.getElementById("event").value;
document.getElementById("search_div1").innerHTML="";
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
  {
  if (xmlhttp0.readyState==4 && xmlhttp0.status==200)
    {
    getStr=xmlhttp0.responseText;
	strArray=getStr.split("^>"); 
	var i; var email="";
	for(i=0;i<strArray.length/4;i++){	
	var e_name="";
	e_name=strArray[i*4+0].trim(" ");	
	var e_address="";
	e_address=strArray[i*4+1];	
	var p_image="";
	p_image=strArray[i*4+2];	

	email=strArray[i*4+3];
	//.......
	if(e_name==""){div_inner="";}else{
	div_inner=div_inner+"<form action='other_profile.jsp' method='post' onSubmit='show()'><input type='hidden' name='pid' value='"+email+"'><input type='submit' 	value='"+e_name+","+e_address+"' ></form><br>";}
	 }
	document.getElementById("search_div1").innerHTML=div_inner;
   
  	}
  }
xmlhttp0.open("GET","get_a_c_events.jsp?cnd="+cnd,true);
xmlhttp0.send();

}
<!--autocomplete-->

function show_hide_fr_div(){
	if(document.getElementById("fr_div").style.display=="none")
	document.getElementById("fr_div").style.display="block";
	else
	document.getElementById("fr_div").style.display="none";	
	}
function accept1(passid){
	passed_id=passid.substr(2);
	change_status(passed_id,"a");
	}
function reject1(passid){ 
	passed_id=passid.substr(2);
	change_status(passed_id,"r");
	}
function change_status(pid,status){
	pval=status+"_"+pid;
if (window.XMLHttpRequest)   
  {
  // code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp0=new XMLHttpRequest();
  }
else
  {
  // code for IE6, IE5
  xmlhttp0=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp0.onreadystatechange=function()	
  {
  if (xmlhttp0.readyState==4 && xmlhttp0.status==200)
    {
    getStr=xmlhttp0.responseText;
		getStr=getStr.trim(" ");
	document.getElementById("div_"+pid).innerHTML=getStr;
   
  }
  }
xmlhttp0.open("GET","change_status.jsp?cnd="+pval,true);
xmlhttp0.send();

	//------------
	}rue
	
	//global
		
function sel_des_all(){
		var f_l=document.getElementById("tf_friend_list_org").value;	
		var f_arr=f_l.split(","); 
	if(document.getElementById("all").checked==false){
		//deselect all check fields
		for(i=0;i<f_arr.length;i++){
			document.getElementById(f_arr[i]).checked=false;
			}			
			document.getElementById("tf_friend_list").value="";
		}else{
		//select all check fields
		for(i=0;i<f_arr.length;i++){
			document.getElementById(f_arr[i]).checked=true;
			}
			document.getElementById("tf_friend_list").value="all";	
			
			}
	}
	
function sel_des_cb(pid){	
	if(document.getElementById(pid).checked==false){
		//remove this id from text field named tf_friend_list		
			tf_friend_list_value=document.getElementById("tf_friend_list").value;
			//tf_friend_list_value=tf_friend_list_value.trim(pid);
			var pid_length=pid.length; 
			var start_index=tf_friend_list_value.indexOf(pid); //alert(start_index);
			tf_friend_list_value1=tf_friend_list_value.substring(0,start_index);
			tf_friend_list_value2=tf_friend_list_value.substring(start_index+pid_length);
			tf_friend_list_value=tf_friend_list_value1+tf_friend_list_value2;
			document.getElementById("tf_friend_list").value=tf_friend_list_value;
			//alert(document.getElementById("tf_friend_list").value);
		}else{				
			tf_friend_list_value=document.getElementById("tf_friend_list").value;
			document.getElementById("tf_friend_list").value=tf_friend_list_value+","+pid;
			//alert(document.getElementById("tf_friend_list").value);			
			}
	}
	
	//chat part starts--------------------------------
	function show_hide_messagediv(pid){ 
	if(pid==document.getElementById("current_chat_frn_id").value){ 
		document.getElementById("messagediv").style.display="none";
		document.getElementById("current_chat_frn_id").value="";//this if becomes true only when a friend button is clicked 2 times. when the button is clicked for 3rd time, it is to be shown, so this line is required.
	}
	else{
	//document.getElementById("messagediv").innerHTML="<br>Contents of chat with "+pid+document.getElementById("messagediv").innerHTML; 
	
	document.getElementById("messagediv").style.display="block";	
	document.getElementById("current_chat_frn_id").value=pid;
	//get chat contents from database and update starts
	getChatData(pid);	
	//get chat contents from database and update ends
	}
		
	}


function getChatData(pid1){ //alert("getChatData called");
	msg2=pid1;
	var div_inner2="";
	var getStr2=0;
	var strArray2;
	if (window.XMLHttpRequest)   
  {
  // code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp2=new XMLHttpRequest();
  }
else
  {
  // code for IE6, IE5
  xmlhttp2=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp2.onreadystatechange=function()	
  {//alert(xmlhttp2.readyState+"      "+xmlhttp2.status);//
  if (xmlhttp2.readyState==4 && xmlhttp2.status==200)
    {
    getStr2=xmlhttp2.responseText;
		getStr2=getStr2.trim(" "); //alert(getStr2);
		strArray2=getStr2.split("^>"); 
	var i; 
	for(i=0;i<strArray2.length/5;i++){ 	
	var sender="";
	sender=strArray2[i*5+0].trim(" ");	
	var receiver="";
	receiver=strArray2[i*5+1];	
	var message="";
	message=strArray2[i*5+2];	//alert(message);
	var date_time="";
	date_time=strArray2[i*5+3];
	var sender_name="";
	sender_name=strArray2[i*5+4]; //alert(sender_name);
	//.......
	if(sender==""){div_inner2="";}else{ sender2="";//alert(sender+","+pid); //
		if(sender==pid1){sender2="<font color=red>"+sender_name+"</font>";}else{sender2="<font color=green>"+sender_name+"</font>";}
	div_inner2=div_inner2+sender2+": &nbsp;&nbsp;&nbsp;<font color=brown size=-1>"+date_time+"</font><br>&nbsp;&nbsp;"+message+"  <br>";} 
	 }
	document.getElementById("messagearea").innerHTML=div_inner2+"<br>";
    document.getElementById("messagediv").scrollTop=document.getElementById("messagediv").scrollHeight;
  }
  }
xmlhttp2.open("GET","getChatData.jsp?msg2="+msg2,true);
xmlhttp2.send();

window.setTimeout("getChatData(msg2);",2000);
	}
<!--chat part starts-->
function sendChatMsg(){
	msg1=document.getElementById("message").value;
	document.getElementById("message").value="";
	frn_id=document.getElementById("current_chat_frn_id").value;
	msg1=msg1+"___"+frn_id; //alert(msg1);
	
		
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
  {//alert(xmlhttp1.readyState+"      "+xmlhttp1.status);//
  if (xmlhttp1.readyState==4 && xmlhttp1.status==200)
    {
    getStr=xmlhttp1.responseText;
		getStr=getStr.trim(" ");
		//alert(getStr);   
  }
  }
xmlhttp1.open("GET","chat1.jsp?msg1="+msg1,true);
xmlhttp1.send();

	
	
	
	}
<!--------------------chat part ends----------------------->
</script>
</head>

<body bgcolor="#CCCCCC";>
<jsp:include page="head.jsp"/>
<span style="position: absolute; left: 820px; top: 12px; height: 26px; z-index: 11">
    <a href="main_mm.jsp">Meetei Mayek</a>
</span>
<span style="position: absolute; left: 1020px; top: 12px; height: 26px; z-index: 11">
<input type="search" name="event" id="event" placeholder="type to search" style="border-radius:10px; font-family:'Comic Sans MS', cursive; color:#00C"   size="30" maxlength="15" onkeyup="search_event();" />
</span>

 <form action="post.jsp" method="post" enctype="multipart/form-data" onsubmit="return check_post();">
<div style="position: absolute; left: 186px; top: 100px; width: 441px;"> 
<table>
<tr><td><textarea style="border-radius:10px;" id="description" name="description" rows="5" cols="45"></textarea></td></tr>
<tr><td><input class="my_button" type="file" name="file1" value="Photo" /><input class="my_button" type="submit" value="Post" /></td></tr></table>

<hr /></div>
<%
try{
MyConnection mycon=new MyConnection();
Connection con=mycon.conDB();
if(con==null){
	out.println("Database connection failed!");	}
	else	{
		%>
        <div id="friends_list" style="position: absolute; overflow: scroll; background-color: #CCC; left: 588px; top: 100px; width: 230px; height: 150px; border-radius:10px;">
<%
//-------------get friend ids-----------------
Statement st_fl=con.createStatement();
ResultSet rs_fl=st_fl.executeQuery("select member_id,Name,p_image from members,users where main_id like '"+session.getAttribute("u_id")+"' and members.member_id=users.Email");
//variable for storing friends list
String friends_list="";
out.println("<table><tr><td><input type='checkbox' name='all' id='all' checked=true onchange='sel_des_all()'></td><td><font color=red>All</font></td></tr>");
while(rs_fl.next()){
	out.println("<tr><td><input type='checkbox' id='"+rs_fl.getString("member_id")+"' name='"+rs_fl.getString("member_id")+"' checked=true onchange='sel_des_cb(id)'></td><td>"+rs_fl.getString("Name")+"</td><td><img src='images/"+rs_fl.getString("p_image")+"' width=30 height=30></td></tr>");
	if(friends_list.equals(""))
	friends_list=rs_fl.getString("member_id");
	else	
	friends_list=friends_list+","+rs_fl.getString("member_id");
	}	
out.println("</table>");
	%>
    <input type="hidden" name="tf_friend_list_org" id="tf_friend_list_org" value="<%=friends_list%>" />
    <input type="hidden" name="tf_friend_list" id="tf_friend_list" value="all" />
</div>
</form>
<%

		//save comment
		if(request.getParameter("bt_Comment")!=null){
			String comment=request.getParameter("comment");
			String p_id=request.getParameter("p_id");	
			if(!comment.equals(""))	{	
			Statement st03=con.createStatement();
			st03.executeUpdate("insert into post_comments(p_id,comment,commenter_id) values('"+p_id+"','"+comment+"','"+session.getAttribute("u_id")+"')");
			}
			}
Statement st=con.createStatement();
%>

<div style="position: absolute; left: 183px; top: 311px; width: 600px">
<%
//-------------get friend ids-----------------
String where_cnd_part="";
ResultSet rs0=st.executeQuery("select member_id from members where main_id like '"+session.getAttribute("u_id")+"'");
while(rs0.next()){
	where_cnd_part=where_cnd_part+"or post.p_u_id like '"+rs0.getString("member_id")+"'";
	}
ResultSet rs=st.executeQuery("select * from post where (post.p_u_id like '"+session.getAttribute("u_id")+"' "+where_cnd_part+") order by post.p_date desc");
while(rs.next()){
	int show=0;
	//if this post is uploaded by the user himself, then, show the post........................................
	String c_u_id=(String)session.getAttribute("u_id");
	if(rs.getString("p_u_id").equals(c_u_id)){ show=1;
	}else{	int p_sl_no_found_in_pa=0;
	//else, if this post does not have any entry in post_access, then it is open to all friends, so, show the post
			Statement st_f_i_pa=con.createStatement();
			ResultSet rs_f_i_pa=st_f_i_pa.executeQuery("select * from post_access where p_id='"+rs.getString("sl_no")+"'");
			while(rs_f_i_pa.next()){
				p_sl_no_found_in_pa=1;
				if(rs_f_i_pa.getString("viewer_id").equals(c_u_id)){  show=1; }//this post has entry in post_access and current user is also found in the entry list, then show the post			
				}
			if(p_sl_no_found_in_pa==0){  show=1;		}
					//else, do not show
	}
//..............................................................................
	if(show==1){
	
	//out.println ("<div style='position: absolute; width:500px'>" );
	//check each record for availability in post_attachment table
	Statement st02 =con.createStatement ();
	ResultSet rs02=st02.executeQuery("select att_name from post_attachment where post_sl_no='"+rs.getString("sl_no")+"'");
	int found=0; String att_name="";
	while(rs02.next()){
		att_name=rs02.getString("att_name");
		found=1;
		}
 //get name and p_image of the person who has posted current item-------------------
	String c_p_name ="" ;
	String c_p_image ="" ;
	Statement st01 =con.createStatement ();
	ResultSet rs01=st01.executeQuery ("select Name,p_image from users where Email like '" +rs.getString ("p_u_id" )+"'" );	
	while (rs01.next ()){
	c_p_name =rs01.getString ("Name" );
	c_p_image =rs01.getString ("p_image" );
	}
	rs01.close (); st01.close ();
//---------------------------------------------------------------------	
	 out.println ("<div><table><tr><td width='50'><img style='border-radius:5px;' src='images/" +c_p_image +"' width=50 height=50></td><td width='250'>" +c_p_name +"<br>"+rs.getString ("p_date" )+"</td></tr><tr class='l_name'><td colspan='2'>" +rs.getString ("description" )+"</td></tr></table>");
	 if(found==1){
	 out.println("<img src='images/"+att_name+"' width=400 height=200>" );
	 }
	 //old comment area starts----------------------------------------
	 Statement st04 =con.createStatement ();
	ResultSet rs04=st04.executeQuery ("select comment,commenter_id,Name,p_image from post_comments,users where p_id = '" +rs.getString("sl_no")+"' and post_comments.commenter_id=users.Email" );	
	while(rs04.next()){
	out.println("<table><tr><td width='40'>"+rs04.getString("Name")+"<br><img src='images/"+rs04.getString("p_image")+"' width=30 height=30></td><td class='l_name' width='200'>"+rs04.getString("comment")+"</td></tr></table>");
	}
	rs04.close (); st04.close ();
	
//--------------------------new comment area starts--------------------------
	 out.println("<form action='' method='post'><table><tr><td><input type='hidden' name='p_id' value='"+rs.getString("sl_no")+"'><textarea id='comment' name='comment' rows='1' cols='30'></textarea></td><td><input class='my_button' type='submit' value='Comment' name='bt_Comment'></td></tr></table></form><hr></div>" );
	}
	
	
	}
	//out .println ("</div>" );
	%>
	 </div>
     
<!----------------------Request Counter---------------------------------->

<div style="position: absolute; top: 12px; left: 914px; position:fixed;">
<% 
int no_req=0;
rs=st.executeQuery("select count(*) from friend_requests where request_id like '"+session.getAttribute("u_id")+"' and status='initiated'"); 
while(rs.next()){	no_req=rs.getInt(1);	} 
%>
<input type="button" value="<%=no_req%>" style="background-image:url(images/red.png)" onclick="show_hide_fr_div()" />
<div id="fr_div" style="display:none; z-index:5"><form action="" method="post"><table>
<% 
rs=st.executeQuery("select Name,sl_no from friend_requests,users where friend_requests.request_id like '"+session.getAttribute("u_id")+"' and friend_requests.main_id=users.Email  and status='initiated'"); 
while(rs.next()){ %>
	<tr><td><%=rs.getString(1)%></td><td><div id="div_<%=rs.getString(2)%>"><input id="a_<%=rs.getString(2)%>" type="button" value="Accept" onclick="accept1(id);"> <input type="button" id="r_<%=rs.getString(2)%>" value="Reject"  onclick="reject1(id);"></div></td></tr>
	<% } 
%>
</table></form>
</div>
</div>
<!------------------->

<!-------------------------------autocomplete part1 starts----------------------------------->

<div id="search_div" style="position: absolute; left: 711px; top: 346px; height: 26px; z-index: 11"></div>

<div id="search_div1" style="position: absolute; left: 1018px; top: 48px; height: 26px; z-index: 12; width: 300px;">

</div>

<!---------friends list------------------------>
<div id="friendslist" style="position: absolute; position:fixed; left: 1160px; top: 100px; height: 1000px; z-index: 10; 
width: 200px; background-color:#CCC; border:outset;"> 

<%
Statement stchat=con.createStatement();
ResultSet rschat=stchat.executeQuery("select member_id,p_image,Name,Address from members,users where members.main_id like '"+session.getAttribute("u_id")+"' and members.member_id=users.Email");
out.println("<table>");
while(rschat.next()){
out.println("<tr><td><img style='border-radius:5px;' src='images/"+rschat.getString("p_image")+"' width=30 height=30></td><td style='max-width:100px;'>"+rschat.getString("Name")+"</td><td><input type='button' id='"+rschat.getString("member_id")+"' value='1' style='background-image:url(images/red.png)' onclick='show_hide_messagediv(id)' /></td></tr>");
}	
out.println("</table>");

%>
</div>

<!--------------------------message list-------------------------------------->

<div id="messagediv" style="display:none; position: absolute; position:fixed; background-color:#CCC; left: 880px; top: 100px; height: 495px; z-index: 10; width: 270px; overflow:scroll; padding-left:2px; border:double; vertical-align:baseline">
    <div id="messagearea" style="vertical-align:baseline;">
        
    </div>
    <div style="position:fixed; top:600px; left: 880px; width: 270px; background-color:#CCC; padding-left:3px; border:double;">
        <textarea name="message" id="message"></textarea>
        <input type="submit" value="Send" onclick="sendChatMsg()" />
    </div>
</div>
<input type="hidden" name="current_chat_frn_id" id="current_chat_frn_id" value="">
<%
rs.close();
	st.close();
	con.close();
		}
  }catch(Exception e){out.print(e);}
  
%>

</body>
</html>