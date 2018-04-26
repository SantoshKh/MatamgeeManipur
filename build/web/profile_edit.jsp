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
</head>

<body>
    <jsp:include page="head.jsp"/>
    
 <%
String photo="";
try
{
	Connection con=null;
	MyConnection mc1=new MyConnection();
	if(mc1.conDB()==null){
		out.println("Database connection failed!");
		}
		else{ con=mc1.conDB();
	
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
		//if(name.equals("description")){description=value;}
		
	}
	else
	{
	itemName = FilenameUtils.getName(item.getName()); 	
	File savedFile = new File(config.getServletContext().getRealPath("/")+"\\images\\"+itemName);
	item.write(savedFile);	
	}
}
//---------------------

Statement st=con.createStatement();
int test=st.executeUpdate("update users set p_image='"+itemName+"' where Email='"+session.getAttribute("u_id")+"'");
if(test==1){
response.sendRedirect("profile.jsp");
}else{out.println("Upload failed.");}
//---------------------
		}//else ends
}
}
catch (Exception e){
out.println(e.getMessage());
}
 %>
    
</body>
</html>