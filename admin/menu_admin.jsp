<%@ page import="java.sql.*" %> 
<%@page pageEncoding="UTF-8"%> 
<%

String username12=(String)session.getAttribute("username_naja");//ห้ามลบเด็กน้อยขาด งงดิ 555  
String status=(String)session.getAttribute("status"); 

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
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 </head>
 <body>
  <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="index.jsp">หน้าแรก</a></li>
						 <li>
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><font color="#ffffff"size="3">จัดการข้อมูล</font> <span class="caret"></span></a>
                                <ul class="dropdown-menu">  
<li><a  href="select_brand.jsp">จัดการแบรนสินค้า</a></li>
<li><a  href="select_category.jsp">จัดการประเภทสินค้า</a></li>
<li><a  href="select_img_index.jsp">จัดการรูปหน้าindex</a></li>
<li><a  href="select_member.jsp">จัดการสมาชิก</a></li>
<li><a  href="select_product.jsp">จัดการสินค้า</a></li>
<li><a  href="select_rubber_face.jsp">จัดการหน้ายาง</a></li>
<li><a  href="select_slide_index.jsp">จัดการslideหน้าindex</a></li>
<li><a  href="select_staff.jsp">จัดการพนักงาน</a></li>
<li><a  href="select_user.jsp">จัดการผู้ใช้งาน</a></li>
                                </ul>
                            </li>
   



                        <li><a href="order_cny.jsp">สั่งสินค้า</a></li>
        <% 
		if (username12==null){%>
						<li> <a type="" class=" btn btn-sm"data-toggle="modal" data-target="#myModal"><font color="#ffffff"size="3">เข้าสู่ระบบ</font></a></li>
						<% } %>
					<% if (username12!=null){ %>
					    <li><a href="../logout.jsp"><font color="#ffffff"size="3">ออกจากระบบ</font></a></li>
						<% } %>
</li>                    
                    </ul>

                </div>
  <%@ include file="../fromlogin.jsp" %>
 
 </body>
</html> 
