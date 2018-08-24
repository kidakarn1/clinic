<%@page pageEncoding="UTF-8"%>
<%@ include file="connect.jsp"%>
<%
String mem_id=(String)session.getAttribute("username_naja");
String id=request.getParameter("id");
int p1=0;
ResultSet cat_id = null;
ResultSet res_c = null;
ResultSet res_band = null;
ResultSet nub_product = null;
ResultSet nub_yang = null;
ResultSet nub_yang1 = null;
try{
	 request.setCharacterEncoding("UTF-8");
	 Statement stmt_cat = connection.createStatement();
	 String sql_cat="";
	 sql_cat="select * from category where cat_id = '"+id+"'";
	 cat_id=stmt_cat.executeQuery(sql_cat);

	 Statement stmt_c = connection.createStatement();
	 Statement stmt_c1 = connection.createStatement();
	 String sql_c="select * from product,brand,rubber_face where product.cat_id = '"+id+"' and product.pro_name = brand.brand_id and product.rub_id = rubber_face.rub_id";
	 res_c=stmt_c.executeQuery(sql_c);
	 res_band=stmt_c1.executeQuery(sql_c);
	 res_band.next();
	 //String brand_name_s=res_band.getString("brand_name");
	 Statement nub_yang1_stmt = connection.createStatement();
	 /*การนับจำนวนยาง ตามยี่่ห้อ*/
	 Statement stmt_nub_yang = connection.createStatement();
	 String sql_yang="";
	 sql_yang="select count(pro_name) as pn from product where cat_id = '"+id+"' and pro_name = 'BS'";
	 nub_yang=stmt_nub_yang.executeQuery(sql_yang);
	 nub_yang.next();
	 //
	 Statement nub_product_stmt = connection.createStatement();
	 String sql_nubproduct="";
	 sql_nubproduct="select count(product.pro_id) as p from product,brand where product.cat_id = '"+id+"' and product.pro_name = brand.brand_id and product.pro_name = 'BS'";
	 nub_product=nub_product_stmt.executeQuery(sql_nubproduct);
	 nub_product.next();
}
 catch (Exception ex){
	out.println("connected error : "+ex);	
 }
 %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Gp Bootstrap Template</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link href="css/animate.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">      
	<link href="css/main.css" rel="stylesheet">
	 <link href="css/responsive.css" rel="stylesheet">
	 <link href="css/w3.css" rel="stylesheet">
	 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="css/bootstrap.min.css" rel="stylesheet"> 
	 <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    
  </head>
   <body class="homepage">   
	<header id="header">
        <nav class="navbar navbar-fixed-top" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html">คลีนิคยางยนต์ 	 <%//=nub_product.getInt("p")%><%//=nub_yang.getInt("pn")%></a>
                </div>
				
                <%@ include file="menu_project.jsp" %>
            </div><!--/.container-->
        </nav><!--/nav-->
		
    </header><!--/header-->
	
	<section id="services" class="service-item">
	   <div class="container">
            <div class="center wow fadeInDown">
                <h2><%
				while (cat_id.next()){%>
				<%=(cat_id.getString("cat_name"))%>
				<%}%>
				</h2>
                          </div>
            <div class="row">
			<%
			int x=0;
			int totel=0;
			int band_id=1;
			while (res_c.next()){
				if ((res_c.getString("pro_name").equals("BS"))) { 
				totel=x;
				x++;
				} /*ปิด if */
	 int nun_naja= nub_yang.getInt("pn")-2;
 if((res_c.getString("pro_name"))!=(res_c.getString("brand_id")) && totel>nun_naja){ 
				%>
                <div class="col-sm-6 col-md-4">
                    <div class="media services-wrap wow fadeInDown">
                        <div class="pull-left">
						<font color="#0000ff" size="5"><%= (res_c.getString("brand_name"))%></font>
                            <img class="img-responsive" src="product/<%= (res_c.getString("image"))%>" width="250px">
                        </div>
                        <div class="media-body">
                            <h3 class="media-heading"><font color="#ff0000">แบรนยาง
							<%//out.print(totel);%></font>
							<font color="#660000"><%= (res_c.getString("pro_name"))%></font></h3>
							<%Statement stmt_nub_yang1 = connection.createStatement();
	 String sql_yang1="";
	 sql_yang1="SELECT count(pro_id) as p1 from product where cat_id = '"+id+"' and pro_name = '"+res_c.getString("pro_name")+"'";
	 nub_yang1=stmt_nub_yang1.executeQuery(sql_yang1);
	 nub_yang1.next();
	 p1= nub_yang1.getInt("p1");%>
							<h3 class="media-heading"><font color="#0000ff">จำนวนสินค้าทั้งหมด
							<%//out.print(totel);%></font>
							<font color="#336600"><%out.print(p1);%> เส้น</font></h3>
                            <p>ราคา <font color="#ff0000"><%= (res_c.getString("price"))%></font></p>
							<p>คำอธิบาย <%= (res_c.getString("detail"))%></p>
                        </div>

<%
String pro_id_najaa=res_c.getString("pro_id");
session.setAttribute("pro",pro_id_najaa); //ต้องให้ค่าก่อน

String pro_id_naja = String.valueOf(session.getAttribute("pro"));
//แสดงค่าออกมา เพื่อนำไปใช้ใน inorder ตึ๋งคนหล่อเองจะใครล่ะ
//out.print(username12); แสดงรหัสสมาชิก
%>

<%out.print(pro_id_naja);%>
<form method="post" action="inorder.jsp">
<input type="hidden" name="pro_id" value="<%=pro_id_naja%>">
<input type="hidden" name="brand" value="<%= (res_c.getString("pro_name"))%>">
<input type="hidden" name="price" value="<%= (res_c.getString("price"))%>">
	จำนวน<input type="number" name="number">เส้น
<br>
<br>
	<% if (mem_id==null){%>
<a type=""class=" w3-button w3-green w3-round-large" data-toggle="modal" data-target="#myModal"><font color="#ffffff"size="3">ใส่ตระกร้า</font></a> 
<a href="Description.jsp?idd=<%= (res_c.getString("pro_id"))%>" class="btn btn-warning">รายละเอียด</a>
<% }
else{
%>
<button class=" w3-button w3-green w3-round-large"><font color="#ffffff"size="3">
ใส่ตะกร้า</font></button>
<a href="Description.jsp?idd=<%= (res_c.getString("pro_id"))%>" class="btn btn-warning">รายละเอียด</a>
<%
}
%>

</form>
           
					</div>
                </div>
				<% }//ปิด if
%>
       <%

					band_id++;
						}//ปิด while%>

		</div><!--/.container-->
	</section><!--/#feature-->

	<%//@ include file="insert_basket.jsp"%>
	<%@ include file="footer.jsp"%>
	
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/jquery.isotope.min.js"></script>   
    <script src="js/wow.min.js"></script>
	<script src="js/main.js"></script>
  </body>
</html>
