<%@ page import="java.sql.*" %> 
<%@page pageEncoding="UTF-8"%> 
<%

String username12=(String)session.getAttribute("username_naja"); 
ResultSet rs = null;
ResultSet pro_name = null;
ResultSet nub_yang11 = null;
 try{
	 Statement stmt = connection.createStatement();
	 request.setCharacterEncoding("UTF-8");
	 String sql="";
	 sql="Select * from category";
	 rs=stmt.executeQuery(sql);
	 //
	 Statement stmt_nub_yang11 = connection.createStatement();
	 String sql_yang11="";
	 sql_yang11="select count(pro_id) as pm from order_cny where mem_id = '"+username12+"' and order_status='จองสินค้า'";
	 nub_yang11=stmt_nub_yang11.executeQuery(sql_yang11);
	 nub_yang11.next();
	 //int pm=nub_yang.getInt("pm");
	 //out.print(pm);
	 }
 catch (Exception ex){
	out.println("connected error : "+ex);	
 }
 %>

<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>Document</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap.css" rel="stylesheet">
        <script src="js/bootstrap.js"></script>
        <script src="js/bootstrap.min.js"></script>
 </head>
 <body>
  <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="index.jsp">หน้าแรก</a></li>
						 <li>
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><font color="#ffffff"size="3">ประเภทยาง</font> <span class="caret"></span></a>
                                <ul class="dropdown-menu">  
					<%  
					while (rs.next()){
					%>
					 <li><a  href="products.jsp?id=<%= (rs.getString("cat_id"))%>">
					 <%=(rs.getString("cat_name"))%>
					 </a></li>
					<%		
					}
					%>

                                </ul>
                            </li>
        <% 
		if (username12==null){%>
						<li> <a type="" class=" btn btn-sm"data-toggle="modal" data-target="#myModal"><font color="#ffffff"size="3">เข้าสู่ระบบ</font></a></li>
						<% } %>
					<% if (username12!=null){ %>
					    <li><a href="logout.jsp"><font color="#ffffff"size="3">ออกจากระบบ</font></a></li>
						<li>
						<a href="proorder.jsp">ตระกร้าสินค้า<img src="image/tk.png" width="50"> <font color="#FFFFFF"><%=nub_yang11.getInt("pm")%></font></li>
						<% } %>
</li>                    
                    </ul>

                </div>
  <%@ include file="fromlogin.jsp" %>
 
 </body>
</html> 
	<%//@ include file="Translate.jsp" %>
