<%@page pageEncoding="UTF-8"%>
<%@ include file="connect.jsp"%>
<%@ page import="java.util.ArrayList" language="java" %>
<%
String pro_id=request.getParameter("pro_id");
String mem_id=(String)session.getAttribute("username_naja");
ResultSet pro = null;
ResultSet order = null;
ResultSet res_count = null;
ResultSet res_nub1 = null;
ArrayList ar=new ArrayList();
int pe=1;
try{
	
	 request.setCharacterEncoding("UTF-8");
    Statement stmt_cont1 = connection.createStatement();
	 String sql_nub1="";
	 sql_nub1="select sum(price_sum) as ppp1 from order_cny where mem_id = '"+mem_id+"' and order_status = 'จองสินค้า'";
	 res_nub1=stmt_cont1.executeQuery(sql_nub1);
	 res_nub1.next();
	 pe = res_nub1.getInt("ppp1");
//
	 Statement stmt_cat = connection.createStatement();
	 String sql_order="";
	 sql_order="select * from order_cny,product,category where order_cny.pro_id=product.pro_id and order_cny.mem_id='"+mem_id+"' and product.cat_id = category.cat_id and order_cny.order_status='จองสินค้า'";
	 order=stmt_cat.executeQuery(sql_order);
	 //String ppp=order.getString("price");
     //int pp_sql=Integer.parseInt(ppp);
	 /*Statement stmt_pro = connection.createStatement();
	 String sql_pro="";
	 sql_pro="select * from product ";
	 pro=stmt_pro.executeQuery(sql_pro);
	 *///
	 Statement stmt_cont = connection.createStatement();
	 String sql_count="";
	 sql_count="SELECT SUM(price_sum) AS ps FROM order_cny where mem_id='"+mem_id+"'";
	 res_count=stmt_cont.executeQuery(sql_count);
	 res_count.next();
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
                    <a class="navbar-brand" href="index.html">คลีนิคยางยนต์  <%//=nub_product.getInt("p")%><%//=nub_yang.getInt("pn")%></a>
                </div>
				
                <%@ include file="menu_project.jsp" %>
            </div><!--/.container-->
        </nav><!--/nav-->
		
    </header><!--/header-->
	<br>
	<br>
	<br>
	<br>
	<br>
	 <div class="col-md-offset-5 col-md-9"><h2>รายการสินค้า</h2></div>

                            </div>

                            <div class="row">
                                <div class=" col-md-offset-2">
                                    <div class="col-xs-2 col-md-2">รหัสยาง</div>
									<div class="col-xs-2 col-md-2">ประเภทยาง</div>
                                    <div class="col-xs-2 col-md-2">รูป</div>
                                    <div class="col-xs-1  col-md-1">ราคา</div> 
                                    <div class="col-xs-2 col-md-1">&nbsp;&nbsp;จำนวน</div>
                                    <div class="col-xs-1 col-md-2">ราคารวม</div>
                                    <div class="col-xs-3 col-md-2">รายการสั่งซื้อ</div>
                                </div>
                            </div>

                            <% while (order.next()) { ar.add(order.getString("pro_id")); %>
                                <br>
                                <div class="row">
                                    <div class="col-md-offset-2">
                                        <div class="col-xs-2 col-md-2"><font color="red"><%=(order.getString("brand"))%></font><%=(order.getString("pro_id"))%></div>
										<div class="col-xs-2 col-md-2"><font color="blue"><%=(order.getString("cat_name"))%></font></div>
                                        <div class="col-xs-2 col-md-2"><img src="product/<%= (order.getString("image"))%>" width="50"></div>
                                        <div class="col-xs-1 col-md-1"><%= (order.getString("price"))%></div>
                                        <form method="post" action="ordernumber.jsp" class="success">
                                            <div class="col-xs-2 col-md-1 "><input  type="text"  name="ordernumber"  value="<%= (order.getString("number"))%>"size="1">
<input type="hidden" name="id_pro"value="<%= (order.getString("pro_id"))%>">
<input type="hidden"name="price"value="<%= (order.getString("price"))%>">
                                     <input type="hidden" name="idproduct"value="<%= (order.getString("price_sum"))%>">
                                                <font color="ffffff"><input type="submit"class=" btn btn-xs label-success" value="ยืนยัน"></font>   <!-- ?? -->

                                            </div>
                                        </form>
                                        <div class=" col-xs-1 col-md-2"><%= (order.getString("price_sum"))%></div>
                                        <div class="col-xs-1 col-md-1 "><div class="col-xs-offset-2"><a href="cancleorder.jsp?pro_id=<%= (order.getString("pro_id"))%>"><font color="#ffffff"><input type="submit"class="btn btn-sm label-danger" value="ยกเลิก"></font></a></div>
                                        </div>
                                    </div>
                                </div>


                                <%

				//int sum_pp_sql=pp_sql;
				//int totle11=sum_pp_sql+pp_sql;
                            }

								/*
                            $sql6 = "select sum(price_sum) as pricesum from orderdns where mem_id='$_SESSION[mem_id]' and order_id='' ";
                            $res6 = mysqli_query($conn, $sql6);
                            $row6 = mysqli_fetch_array($res6);
                            ?*/%>
<div class="row">
                            <div class="col-md-offset-2">
                                <h4><div class="col-md-offset-7 col-xs-7 col-md-4">ราคาที่ต้องชำระ<font color="blue"> <%out.print(pe);%></font> บาท</div></h4>
                                <div class="col-sm-offset-2 col-md-offset-4 col-xs-2 col-md-1">
<form id="ustatus" method="get" action="updatestatus.jsp">
 <%
     int i=0;
     for(i=0;i<ar.size();i++)
     {%>
	 <input type="hidden" name="pro_id" value="<%=ar.get(i)%>">
	 <%
      
     }
    %>

                            <button id="buy" type="submit" class="col-md-offset-6 col-md-12 btn btn-sm btn-success">สั่งซื้อ</button></form>
                        </div>
                            </div>
                        </div>
                        </center><br>

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
