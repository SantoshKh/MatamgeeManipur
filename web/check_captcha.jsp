<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,javax.servlet.*,javax.servlet.http.*,java.sql.*"%>
<%@page import="database_connection.*"%>
<% 
String cnd=request.getParameter("cnd");
String cndarr[]=cnd.split("_");
Connection con=null;
	MyConnection mc1=new MyConnection();
	if(mc1.conDB()==null){
		out.println("Database connection failed!");
		}else{
con=mc1.conDB();
}
ResultSet rs=null;
Statement st=con.createStatement();
String sl_no=cndarr[1];
rs=st.executeQuery("select captcha from captcha where sl_no like '"+sl_no+"'");
String valueString=" ^>"+"not found";
while(rs.next()){
	if(rs.getString("captcha").equals(cndarr[0])){
			valueString=rs.getString("captcha")+" ^>"+"found";
	}
			}
%>
<%=valueString%>