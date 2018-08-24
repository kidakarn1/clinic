<%@page pageEncoding="UTF-8"%>
<%@ include file="connect.jsp"%>
 <%
 String pro_id=request.getParameter("pro_id");
 String mem_id=(String)session.getAttribute("username_naja");
 ResultSet res_update = null;
try{
	 //
		if(!connection.isClosed()){
		 request.setCharacterEncoding("UTF-8");
		 Statement stmt_replate = connection.createStatement();
		 String sql_replate="";
	 	 sql_replate="delete from order_cny where mem_id='"+mem_id+"' and pro_id='"+pro_id+"'";
	 int res_replate1=stmt_replate.executeUpdate(sql_replate);
	 //res_replate=stmt_replate.executeUpdate(sql_replate);
	 if (res_replate1>0){
		%>
		<meta http-equiv="refresh" content="0;url=proorder.jsp?pro_id=<%= pro_id%>" />
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