<%@page pageEncoding="UTF-8"%>
<%@ include file="connect.jsp"%>
<%
String mem_id=(String)session.getAttribute("username_naja");
String idd=request.getParameter("idd");
int p1=0;
ResultSet cat_id = null;
ResultSet res_c = null;
ResultSet res_band = null;
ResultSet nub_product = null;
ResultSet nub_yang = null;
ResultSet nub_yang1 = null;
try{
	 Statement stmt_c = connection.createStatement();
	 Statement stmt_c1 = connection.createStatement();
	 String sql_c="select * from product,brand,rubber_face where product.pro_id='"+idd+"' and product.pro_name = brand.brand_id and product.rub_id = rubber_face.rub_id  ";
	 res_c=stmt_c.executeQuery(sql_c);
	 res_c.next();
	 //String brand_name_s=res_band.getString("brand_name");
	 //
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
                          </div>
            <div class="row">
		         <div class="col-md-offset-2 col-sm-6 col-md-8">
                    <div class="media services-wrap wow fadeInDown">
                        <div class="pull-left">
						<font color="#0000ff" size="5"><%= (res_c.getString("brand_name"))%></font>
                            <img class="img-responsive" src="product/<%= (res_c.getString("image"))%>" width="120px">
                        </div>
                        <div class="media-body">
                            <h3 class="media-heading"><font color="#ff0000">แบรนยาง
							<%//out.print(totel);%></font>
							<font color="#660000"><%= (res_c.getString("pro_name"))%></font></h3>
							<p>ราคา <font color="#ff0000"><%= (res_c.getString("price"))%></font></p>
			<p>คำอธิบาย <%= (res_c.getString("detail"))%></p>
<form method="post" action="inorder.jsp">
<input type="hidden" name="pro_id" value="<%= res_c.getString("pro_id")%>">
<input type="hidden" name="brand" value="<%= (res_c.getString("pro_name"))%>">
<input type="hidden" name="price" value="<%= (res_c.getString("price"))%>">
	จำนวน<input type="number" name="number">เส้น
	<br>
	<br>
<button class=" w3-button w3-green w3-round-large"><font color="#ffffff"size="3">
ใส่ตะกร้า</font></button>
</form>
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
