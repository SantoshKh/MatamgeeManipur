<script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
<script>
function show_hide_logout(){
	if(document.getElementById("inner_div").style.display=="none")
	document.getElementById("inner_div").style.display="block";
	else
	document.getElementById("inner_div").style.display="none";
	}
</script>
<link href="SpryAssets/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css">
<div style="position:absolute; position:fixed; top:2px; left:15px;"><img  style="border-radius:5px;" src="images/logo.png" width="150" height="70"></div>

<div style="position: absolute; position:fixed; left: 180px;"  align="center"></div>
<div style="position: absolute;  position:fixed; width: 1000px; height: 20px; top: 10px; left: 176px; z-index:20;">
<ul id="MenuBar1" class="MenuBarHorizontal">
<li><a href="main.jsp">Home</a></li>
<li><a href="profile.jsp">Profile</a></li>
<li><a href="members.jsp">Member</a></li>
<li><a href="feedback.jsp">Feedback</a></li>
</ul>
<script type="text/javascript">
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"SpryAssets/SpryMenuBarDownHover.gif", imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
</script>
</div>
<% if(session.getAttribute("u_id")!=null){ %>
<div style="position: absolute; position:fixed; top: 10px; left: 1270px;">
<img src="images/<%=session.getAttribute("p_image")%>" width="50" height="50" onclick="show_hide_logout()">
<div id="inner_div" style="display:none"><br><a href="Signout.jsp"><input type="button" value="Sign out" /></a></div> 
</div>
<% } 
char aChar = '?';
int  anInt = aChar;

boolean isDefined = Character.isDefined(anInt);
//out.println("dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd="+isDefined+"  "+aChar);
/////////////////
%>
