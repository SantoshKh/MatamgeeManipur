<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,javax.servlet.*,javax.servlet.http.*,java.sql.*"%>
<%@page import="database_connection.*"%>
<% 
String cnd=request.getParameter("cnd");
Connection con=null;
	MyConnection mc1=new MyConnection();
	if(mc1.conDB()==null){
		out.println("Database connection failed!");
		}else{
con=mc1.conDB();
}
ResultSet rs=null;
Statement st=con.createStatement();
rs=st.executeQuery("select Name,Address,p_image,Email from users where Name like '%"+cnd+"%' or Address like '%"+cnd+"%' limit 10");
String valueString=""; int i=0;
if(!cnd.equals("")){	
while(rs.next()){
	if(valueString==""){
			valueString=rs.getString(1)+"^>"+rs.getString(2)+"^>"+rs.getString(3)+"^>"+rs.getString(4);	}
			else{
		valueString=valueString+"^>"+rs.getString(1)+"^>"+rs.getString(2)+"^>"+rs.getString(3)+"^>"+rs.getString(4);
			}
			}
}
%>
<%=valueString%>