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
ResultSet res_member = null;
ResultSet res_nub_cny = null;
int pe=1;
int getInt=0;
try{
	
	 request.setCharacterEncoding("UTF-8");
//
	  Statement stmt_member = connection.createStatement();
	 String sql_member="";
	 sql_member="select * from member where mem_id ='"+mem_id+"'";
	 res_member=stmt_member.executeQuery(sql_member);
	 res_member.next();
	//
	 Statement stmt_count_cny = connection.createStatement();
	 String sql_count_cny="";
	 sql_count_cny="select * from order_cny order by order_id desc";
	 res_nub_cny=stmt_count_cny.executeQuery(sql_count_cny);
	 res_nub_cny.next();
	 getInt=res_nub_cny.getInt("order_id");
	// getInt=getInt+1;
	 //int number_int=Integer.parseInt(number);	

	//

     Statement stmt_cont1 = connection.createStatement();
	 String sql_nub1="";
	 sql_nub1="select sum(price_sum) as ppp1 from order_cny where mem_id = '"+mem_id+"' and order_status = 'กำลังจัดส่ง' and order_id = '"+getInt+"'";
	 res_nub1=stmt_cont1.executeQuery(sql_nub1);
	 res_nub1.next();
	 pe = res_nub1.getInt("ppp1");
//
	 Statement stmt_cat = connection.createStatement();
	 String sql_order="";
	 sql_order="select * from order_cny,product,category where order_cny.pro_id=product.pro_id and order_cny.mem_id='"+mem_id+"' and product.cat_id = category.cat_id and order_cny.order_status='กำลังจัดส่ง' and order_id = '"+getInt+"'";
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
  <style>
  .color_name{
  color:#3300ff;
  }
  </style>
   <body class="homepage" >   
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
	 <div class="col-md-offset-5 col-md-9"><h2 class="color_name">รายการสินค้าที่คุณ <%= res_member.getString("fname")+" "+res_member.getString("lname")%></h2></div>

                            </div>

                            <div class="row">
                                <div class=" col-md-offset-2">
                                    <div class="col-xs-2 col-md-2">ลำดับ</div>
									<div class="col-xs-2 col-md-2">รหัสยาง</div>
									<div class="col-xs-2 col-md-2">ประเภทยาง</div>
                                    <div class="col-xs-2 col-md-2">รูป</div>
                                    <div class="col-xs-1  col-md-1">ราคา</div> 
                                    <div class="col-xs-2 col-md-1">&nbsp;&nbsp;จำนวน</div>
                                    <div class="col-xs-1 col-md-2">ราคารวม</div>
                                    <!-- <div class="col-xs-3 col-md-2">รายการสั่งซื้อ</div> -->
                                </div>
                            </div>
					  <% 
			int i=1;
			while (order.next()) { %>
                                <br>
                                <div class="row">
                                    <div class="col-md-offset-2">
                                        <div class="col-xs-2 col-md-2"><font color="blue"><%= i%></font></div>
										
										<div class="col-xs-2 
										col-md-2"><font color="red"><%=(order.getString("brand"))%></font><%=(order.getString("pro_id"))%></div>

										<div class="col-xs-2 col-md-2"><font color="blue"><%=(order.getString("cat_name"))%></font></div>
                                        <div class="col-xs-2 col-md-2"><img src="product/<%= (order.getString("image"))%>" width="50"></div>
                                        <div class="col-xs-1 col-md-1"><%= (order.getString("price"))%></div>
                                     <div class="col-xs-2 col-md-1 "><%= (order.getString("number"))%>
                                            </div>
                                        <div class=" col-xs-1 col-md-2"><%= (order.getString("price_sum"))%></div>
                                        <div class="col-xs-1 col-md-1 "><div class="col-xs-offset-2"></div>
                                        </div>
                                    </div>
                                </div>


                                <%

				//int sum_pp_sql=pp_sql;
				//int totle11=sum_pp_sql+pp_sql;
                            i++;
							}
							%>
	<div class="row">
                            <div class="col-md-offset-2">
                                <h4><div class="col-md-offset-7 col-xs-7 col-md-4">ราคาที่ต้องชำระ<font color="blue"> <%out.print(pe);%></font> บาท</div></h4>
								<div class="col-md-offset-7 col-xs-7 col-md-4">			<div class="print_p_hid">
								<a id="hide" href="#" class="btn btn-warning">
								ปริ้นใบเสร็จ</a></div>  
                                </div>
								<div class="col-sm-offset-2 col-md-offset-4 col-xs-2 col-md-1">
								<center>
<table border="0">
<tr>
<td><div class="print_p_hid"><a href="tyou.jsp" class="btn btn-success">ตกลง</a></div></td>
    </tr>
</table>						</center>
						</div>
                        
							</div>
          
						</div>
			
						<%//@ include file="insert_basket.jsp"%>
	<%@ include file="footer.jsp"%>
	
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/jquery.isotope.min.js"></script>   
    <script src="js/wow.min.js"></script>
	<script src="js/main.js"></script>
	<script>
$(document).ready(function(){
    $("#hide").click(function(){
        $(".print_p_hid").hide();
		 window.print();
    });
});
	</script>
  </body>
</html>
