<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,javax.servlet.*,javax.servlet.http.*,java.sql.*"%>
<%@page import="database_connection.*"%>
<% 
String cnd=request.getParameter("msg1");
String[] arr=cnd.split("___");
String cuid=(String)session.getAttribute("u_id");
Connection con=null;
	MyConnection mc1=new MyConnection();
	if(mc1.conDB()==null){
		out.println("Database connection failed!");
		}else{
con=mc1.conDB();
}
ResultSet rs=null;
Statement st=con.createStatement();
int chk=st.executeUpdate("insert into chat(sender,receiver,message,date_time) values('"+cuid+"','"+arr[1]+"','"+arr[0]+"','"+new Timestamp(System.currentTimeMillis())+"')");
String valueString="not ok";
if(chk==1){valueString="okkkk";}
%>
<%=valueString%>






