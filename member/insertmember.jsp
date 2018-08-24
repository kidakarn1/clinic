<%@ page import="java.sql.*" %> 
<%@page pageEncoding="UTF-8"%>
<%@ include file="../connect.jsp"%>
<%
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String sex=request.getParameter("sex");
String line=request.getParameter("line");
String facebook=request.getParameter("facebook");
String address=request.getParameter("address");
String brithday=request.getParameter("brithday");
String phone=request.getParameter("phone");
ResultSet res_pro = null;
ResultSet res_order = null;
ResultSet res_replate = null;
ResultSet res_select = null;
try{
		if(!connection.isClosed()){
		 request.setCharacterEncoding("UTF-8");
		 Statement stmt_replate = connection.createStatement();
		 String sql_replate="";
	 	 sql_replate="insert into member values('0','"+fname+"','"+lname+"','"+sex+"','"+phone+"','"+line+"','"+facebook+"','"+address+"','"+brithday+"')";
	int res_replate1=stmt_replate.executeUpdate(sql_replate);
		 Statement stmt_user = connection.createStatement();
		 String sql_user="";
	 	 sql_user="insert into user values('0','"+phone+"','"+phone+"','user')";
	int res_user=stmt_user.executeUpdate(sql_user);
	 //res_replate=stmt_replate.executeUpdate(sql_replate);
	 if (res_replate1>0 && res_user>0){
		out.print("insert จำนวน"+res_replate1+"แถว");
		out.print("<a href='showDb.jsp'>show</a>");
		%>
		<meta http-equiv="refresh" content="0;url=../admin/select_member.jsp" />			<%
		}
		else{
		out.print("error เพิ่มข้อมูลไม่ได้");
		}
		}
//
}
 catch (Exception ex){
	out.println("connected error : "+ex);	
 }
 %>
