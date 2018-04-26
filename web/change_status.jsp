<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,javax.servlet.*,javax.servlet.http.*,java.sql.*"%>
<%@page import="database_connection.*"%>
<% 
String cnd=request.getParameter("cnd");
String a_r=cnd.substring(0,2);
if(a_r.equals("a_")){a_r="accepted";}else{a_r="rejected";}
String sl_no=cnd.substring(2);
Connection con=null;
	MyConnection mc1=new MyConnection();
	if(mc1.conDB()==null){
		out.println("Database connection failed!");
		}else{
con=mc1.conDB();
}
ResultSet rs=null;
Statement st=con.createStatement();
Statement st1=con.createStatement();
Statement st2=con.createStatement();
Statement st3=con.createStatement();
int chk=st.executeUpdate("update friend_requests set status='"+a_r+"' where sl_no='"+sl_no+"'");
rs=st1.executeQuery("select main_id,request_id from friend_requests where sl_no='"+sl_no+"'");
while(rs.next()){
	st2.executeUpdate("insert into members(main_id,member_id) values('"+rs.getString(1)+"','"+rs.getString(2)+"')");
	st3.executeUpdate("insert into members(main_id,member_id) values('"+rs.getString(2)+"','"+rs.getString(1)+"')");
	}
String valueString="";
if(chk==1){valueString=a_r;}
%>
<%=valueString%>







