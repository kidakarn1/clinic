<%@ page import="java.sql.*" %> 
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.GregorianCalendar" %>
<%@ include file="connect.jsp"%>
<%
request.setCharacterEncoding("UTF-8");
//date ตึ๋งเอง
Calendar c = Calendar.getInstance();
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	String currentDate = df.format(c.getTime());
	out.println("<br>Current Date : " + currentDate); 
	//วันที่ คนหล่อไง
String nb=null;
String pro_id=request.getParameter("pro_id");
session.setAttribute("pro_id1",pro_id); 
String number=request.getParameter("number");
String price=request.getParameter("price");
String brand=request.getParameter("brand");
int number_int=Integer.parseInt(number);
int price_int=Integer.parseInt(price);
int sum=number_int*price_int;
String mem_id=(String)session.getAttribute("username_naja");
ResultSet res_pro = null;
ResultSet res_order = null;
ResultSet res_replate = null;
ResultSet res_select = null;
try{
	 request.setCharacterEncoding("UTF-8");
	 Statement stmt_product = connection.createStatement();
	 String sql_pro="";
	 sql_pro="select*from product where pro_id='"+pro_id+"'";
	 res_pro=stmt_product.executeQuery(sql_pro);
	 res_pro.next();
//
     Statement stmt_order = connection.createStatement();
	 String sql_order="";
	 sql_order="select * from order_cny  where pro_id='"+pro_id+"' and mem_id='"+mem_id+"' and order_id=''";
	 res_order=stmt_order.executeQuery(sql_order);
	 res_order.next();
//
		if(!connection.isClosed()){
		 request.setCharacterEncoding("UTF-8");
		 Statement stmt_replate = connection.createStatement();
		 String sql_replate="";
	 	 sql_replate="replace into order_cny values('"+pro_id+"','0','"+brand+"','"+number+"','"+sum+"','"+mem_id+"','"+currentDate+"','จองสินค้า')";
	 int res_replate1=stmt_replate.executeUpdate(sql_replate);
	 //res_replate=stmt_replate.executeUpdate(sql_replate);
	 if (res_replate1>0){
		out.print("insert จำนวน"+res_replate1+"แถว");
		out.print("<a href='showDb.jsp'>show</a>");
		//
	 Statement stmt_select = connection.createStatement();
	 String sql_select="";
	 sql_select="select * from order_cny  where pro_id='"+pro_id+"' and mem_id='"+mem_id+"'";
	 res_select=stmt_select.executeQuery(sql_select);
	 res_select.next();
		nb=res_select.getString("number");
		out.print(nb);
		//
		%>
		<meta http-equiv="refresh" content="0;url=proorder.jsp?pro_id=<%= pro_id%>" />		<%
		}else{
		out.print("error เพิ่มข้อมูลไม่ได้");
		}
		}
//
}
 catch (Exception ex){
	out.println("connected error : "+ex);	
 }
 %>
