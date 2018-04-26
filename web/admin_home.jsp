<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.io.*,org.apache.commons.io.FileUtils,database_connection.*" errorPage="" %>
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
<script> // A script of js code
// Define a function to display the current time
function displayTime() {
var now = new Date(); // Get current time
// Find element with id="clock"
var elt = document.getElementById("clock");
// Display the time in the element
elt.innerHTML = now.toLocaleTimeString();
// And repeat in one second
setTimeout(displayTime, 1000);
}
// Start the clock when the document loads.
window.onload = displayTime;
</script>
<style> /* A CSS stylesheet for the clock */
#clock { /* Styles apply to element with id="clock" */
font: bold 24pt sans; /* Use a big bold font */
background: #0FF; /* on a light gray background. */
padding: 10px; /* Surround it with some space */
border: solid black 2px; /* and a solid black border */
border-radius: 10px; /* with rounded corners. */
}
</style>

</head>

<body bgcolor="#33FF00">
<span id="clock"></span> <!-- Time inserted here -->
<script type="text/javascript">
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"SpryAssets/SpryMenuBarDownHover.gif", imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
</script>
<jsp:include page="admin_head.jsp"/>
<%
if(request.getParameter("Submit")!=null){
	out.println("submit clicked");
String photo="";
String description="";
try
{
String ImageFile="";
String itemName = "";
boolean isMultipart = ServletFileUpload.isMultipartContent(request);
if (!isMultipart){}
else
{
FileItemFactory factory = new DiskFileItemFactory();
ServletFileUpload upload = new ServletFileUpload(factory);
List items = null;

items = upload.parseRequest(request);

Iterator itr = items.iterator();
while (itr.hasNext())
{
FileItem item = (FileItem) itr.next();
	if (item.isFormField())
	{	
	
		String name = item.getFieldName();
		String value = item.getString();
		if(name.equals("description")){description=value;}
		
	}
	else
	{
	itemName = FilenameUtils.getName(item.getName()); 
	
	out.println("<br>("+itemName+")<br>"); int i=0;
	File savedFile = new File(config.getServletContext().getRealPath("/")+"images\\"+itemName);
	item.write(savedFile);	
	}
}
//---------------------

Connection con=null;
	MyConnection mc1=new MyConnection();
	if(mc1.conDB()==null){
		out.println("Database connection failed!");
		}
		else{
			con=mc1.conDB();
ResultSet rs=null;
Statement st=con.createStatement();
int test=st.executeUpdate("insert into posts(post_description,post_file_name) values('"+description+"','"+itemName+"')");


if(test==1){out.println("Successfully inserted.");
response.sendRedirect("userhome.jsp");
}else{out.println("Insertion failed.");}
//---------------------
		}//else ends
}
}
catch (Exception e){
out.println(e.getMessage());
}

	}
%>
</body>
</html>