<%@ page import="java.sql.*" %> 
<%@page pageEncoding="UTF-8"%>
<%@ include file="../connect.jsp"%>
<%
String id=request.getParameter("id");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String sex=request.getParameter("sex");
String telephone=request.getParameter("phone");
String education=request.getParameter("education");
String Salay=request.getParameter("Salay");
String address=request.getParameter("address");
String brithday=request.getParameter("brithday");
ResultSet res_pro = null;
ResultSet res_order = null;
ResultSet res_replate = null;
ResultSet res_select = null;
try{
		if(!connection.isClosed()){
		 request.setCharacterEncoding("UTF-8");
		 Statement stmt_replate = connection.createStatement();
		 String sql_replate="";
	 	 sql_replate="update staff set fname='"+fname+"',lname='"+lname+"',sex='"+sex+"',telephone='"+telephone+"',education='"+education+"',Salary='"+Salay+"',address='"+address+"',staff_Startdate='"+brithday+"' where staff_id='"+id+"'";
	int res_replate1=stmt_replate.executeUpdate(sql_replate);
	 //res_replate=stmt_replate.executeUpdate(sql_replate);
	 if (res_replate1>0){
		out.print("insert จำนวน"+res_replate1+"แถว");
		out.print("<a href='showDb.jsp'>show</a>");
		%>
		<meta http-equiv="refresh" content="0;url=../admin/select_staff.jsp" />			<%
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
