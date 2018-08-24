<%@page pageEncoding="UTF-8"%>
<%@ include file="connect.jsp"%>
<%String ordernumber=request.getParameter("ordernumber");
  String idproduct=request.getParameter("idproduct");
  String id_pro=request.getParameter("id_pro");
  String price=request.getParameter("price");
  String mem_id=(String)session.getAttribute("username_naja");
  int ordernumber_int=Integer.parseInt(ordernumber);
  int price_int=Integer.parseInt(price);
  ResultSet res_product = null;
  ResultSet res_update = null;
try{
	 request.setCharacterEncoding("UTF-8");
	 Statement stmt_product = connection.createStatement();
	 String sql_product="";
	 sql_product="select * from product where pro_id = '"+idproduct+"'";
	 res_product=stmt_product.executeQuery(sql_product);
	 res_product.next();
     int sum=price_int*ordernumber_int;
	 //
		if(!connection.isClosed()){
		 request.setCharacterEncoding("UTF-8");
		 Statement stmt_replate = connection.createStatement();
		 String sql_replate="";
	 	 sql_replate="update order_cny set number = '"+ordernumber_int+"',price_sum ='"+sum+"' where pro_id='"+id_pro+"' and mem_id = '"+mem_id+"'";
	 int res_replate1=stmt_replate.executeUpdate(sql_replate);
	 //res_replate=stmt_replate.executeUpdate(sql_replate);
	 if (res_replate1>0){
		%>
		<meta http-equiv="refresh" content="0;url=proorder.jsp?pro_id=<%= id_pro%>" />
		<%
		}else{
		out.print("error เพิ่มข้อมูลไม่ได้");
		}
	}

}
 catch (Exception ex){
	out.println("connected error : "+ex);	
 }
%>