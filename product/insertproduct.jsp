<%@ page import="java.sql.*" %> 
<%@page pageEncoding="UTF-8"%>
<%@ include file="../connect.jsp"%>
<%
String id=request.getParameter("id");
String b_id=request.getParameter("b_id");
String cat_id=request.getParameter("cat_id");
String rub_id=request.getParameter("rub_id");
String price=request.getParameter("price");
String image=request.getParameter("image");

ResultSet res_pro = null;
ResultSet res_order = null;
ResultSet res_replate = null;
ResultSet res_select = null;
try{
		if(!connection.isClosed()){
		 request.setCharacterEncoding("UTF-8");
		 Statement stmt_replate = connection.createStatement();
		 String sql_replate="";
	 	 sql_replate="insert into product values('"+id+"','"+b_id+"','"+cat_id+"','"+rub_id+"','"+price+"','"+image+"','')";
	int res_replate1=stmt_replate.executeUpdate(sql_replate);
	 //res_replate=stmt_replate.executeUpdate(sql_replate);
	 if (res_replate1>0){
		out.print("insert จำนวน"+res_replate1+"แถว");
		out.print("<a href='showDb.jsp'>show</a>");
		%>
		<meta http-equiv="refresh" content="0;url=../admin/select_product.jsp" />			<%
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
