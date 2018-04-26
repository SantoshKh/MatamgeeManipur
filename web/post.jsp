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
String description="";
String tf_friend_list="";
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
		if(name.equals("description")){description=value;}
		if(name.equals("tf_friend_list")){tf_friend_list=value;}
	}
	else
	{
	itemName = FilenameUtils.getName(item.getName()); 
	if(itemName.equals("")){}else{
	//generate image name from database
	int image_sl_no=0;
	Statement st00=con.createStatement();
ResultSet rs00=st00.executeQuery("select sl_no from post_attachment");
while(rs00.next()){
	image_sl_no=rs00.getInt("sl_no");
	}
	image_sl_no++;
	itemName =image_sl_no+".jpg";
	
	out.println("<br>("+itemName+")<br>"); int i=0;
	File savedFile = new File(config.getServletContext().getRealPath("/")+"\\images\\"+itemName);
	item.write(savedFile);	
	}
	}
}
//---------------------
		
java.util.Date c_date=new java.util.Date();
java.sql.Date sql_date=new java.sql.Date(c_date.getTime());

ResultSet rs=null;
Statement st=con.createStatement();
int test=st.executeUpdate("insert into post(description,p_date,p_u_id) values('"+description+"','"+sql_date+"','"+session.getAttribute("u_id")+"')");
int post_sl_no=0;
rs=st.executeQuery("select sl_no from post where description like '"+description+"' and p_date='"+sql_date+"'");
while(rs.next()){
	post_sl_no=rs.getInt("sl_no");
	}
//if no file is uploaded, then do not insert in post_attachment
if(itemName.equals("")){}else{	
int test2=st.executeUpdate("insert into post_attachment(post_sl_no,att_name) values('"+post_sl_no+"','"+itemName+"')");
}
//post_access part starts--------------------------
if(!tf_friend_list.equals("all")){//post_access should be updated only when there is selection/filtering in friend list
	String arr[]=tf_friend_list.split(",");	//out.println("["+arr[0]+"]["+arr[1]+"]["+arr[2]+"]");
	for(int i=0;i<arr.length;i++){
		if(!arr[i].equals("")){//insert in post_access
			Statement st_pa=con.createStatement();
			int test_pa=st_pa.executeUpdate("insert into post_access(p_id,viewer_id) values('"+post_sl_no+"','"+arr[i]+"')");

			}
		}
	out.println(arr.length);
	}

//post_access part ends--------------------------Incorrect integer value: 'tomba@gmail.com' for column 'viewer_id' at row 1 

if(test==1){//out.println("Successfully inserted.");
response.sendRedirect("main.jsp");
}else{out.println("Insertion failed.");}
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