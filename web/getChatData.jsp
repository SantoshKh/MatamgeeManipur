<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,javax.servlet.*,javax.servlet.http.*,java.sql.*"%>
<%@page import="database_connection.*"%>
<% 
String cnd=request.getParameter("msg2");
String cuid=(String)session.getAttribute("u_id");
Connection con=null;
	MyConnection mc1=new MyConnection();
	if(mc1.conDB()==null){
		out.println("Database connection failed!");
		}else{
con=mc1.conDB();
}
ResultSet rs=null;
Statement st3=con.createStatement();
int chk=st3.executeUpdate("update chat set read_status='y' where sender like '%"+cnd+"%' and receiver like '%"+cuid+"%'");
Statement st=con.createStatement();
rs=st.executeQuery("select sender,receiver,message,date_time,Name from chat,users where chat.sender=users.Email and (sender like '%"+cuid+"%' and receiver like '%"+cnd+"%' or sender like '%"+cnd+"%' and receiver like '%"+cuid+"%')");
String valueString=""; int i=0;
if(!cnd.equals("")){	
while(rs.next()){
    if(valueString==""){
			valueString=rs.getString(1)+"^>"+rs.getString(2)+"^>"+rs.getString(3)+"^>"+rs.getString(4)+"^>"+rs.getString(5);	}
			else{
		valueString=valueString+"^>"+rs.getString(1)+"^>"+rs.getString(2)+"^>"+rs.getString(3)+"^>"+rs.getString(4)+"^>"+rs.getString(5);
			}
			}
}
%>
<%=valueString%>