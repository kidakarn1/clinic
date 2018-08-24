<%@page pageEncoding="UTF-8"%>
<%@ include file="connect.jsp"%>
<%
ResultSet slide = null;
ResultSet img_query = null;
ResultSet nub_all = null;
ResultSet res_order = null;
ResultSet res_all = null;
ResultSet res_all_cat1 = null;
ResultSet res_all_cat2 = null;
ResultSet res_all_cat3 = null;
int pd_int=0;
int pd_int1=0;
int pd_int2=0;
int pd_int3=0;
try{
	 Statement stmt = connection.createStatement();
	 request.setCharacterEncoding("UTF-8");
	 String sql="";
	 sql="Select * from slide_index";
	 slide=stmt.executeQuery(sql);

	 Statement stmt1 = connection.createStatement();
	 String sql_img="";
	 sql_img="Select * from img_index";
	 img_query=stmt1.executeQuery(sql_img);

	 Statement stmt2 = connection.createStatement();
	 String sql_nub="";
	 sql_nub="SELECT COUNT(pro_id) FROM product ";
	 nub_all=stmt2.executeQuery(sql_nub);

	 Statement stmt3 = connection.createStatement();
	 String sql_order="";
	 sql_order="select * from order_cny,brand where order_status = 'ชำระเงินแล้ว' and order_cny.brand = brand.brand_id ";
	 res_order=stmt3.executeQuery(sql_order);
	 res_order.next();
	 
	 Statement count_all = connection.createStatement();
	 String sql_all="";
	 sql_all="select count(pro_id) as pd from product";
	 res_all=count_all.executeQuery(sql_all);
	 res_all.next();
	 pd_int=res_all.getInt("pd");
 
 
	 Statement count_all1 = connection.createStatement();
	 String sql_all1="";
	 sql_all1="select count(pro_id) as pd1 from product where cat_id='1'";
	 res_all_cat1=count_all1.executeQuery(sql_all1);
	 res_all_cat1.next();
	 pd_int1=res_all_cat1.getInt("pd1");

     Statement count_all2 = connection.createStatement();
	 String sql_all2="";
	 sql_all2="select count(pro_id) as pd2 from product where cat_id='2'";
	 res_all_cat2=count_all2.executeQuery(sql_all2);
	 res_all_cat2.next();
	 pd_int2=res_all_cat2.getInt("pd2");
 
 
     Statement count_all3 = connection.createStatement();
	 String sql_all3="";
	 sql_all3="select count(pro_id) as pd3 from product where cat_id='3' or cat_id='4' or cat_id='5' or cat_id='6' or cat_id='7'";
	 res_all_cat3=count_all3.executeQuery(sql_all3);
	 res_all_cat3.next();
	 pd_int3=res_all_cat3.getInt("pd3");
 
 
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
                    <a class="navbar-brand" href="index.html">คลีนิคยางยนต์</a>
                </div>
				
                 <%@ include file="menu_project.jsp" %>
            </div><!--/.container-->
        </nav><!--/nav-->
		
    </header><!--/header-->
	
	<div class="slider">
		<div class="container">
			<div id="about-slider">
				<div id="carousel-slider" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
				  	<ol class="carousel-indicators visible-xs">
					    <li data-target="#carousel-slider" data-slide-to="0" class="active"></li>
					    <li data-target="#carousel-slider" data-slide-to="1"></li>
					    <li data-target="#carousel-slider" data-slide-to="2"></li>
				  	</ol>


					<div class="carousel-inner">
						
	<%
	int i=1;
	while (slide.next()){%>
					<div class="item 
						<% if (i==1){
							out.print("active");
						}%>">
			<img src="slide_index/<%= (slide.getString("slide_img"))%>">
					   </div>   
	<% i++;} %>
					</div>
					
					<a class="left carousel-control hidden-xs" href="#carousel-slider" data-slide="prev">
						<i class="fa fa-angle-left"></i> 
					</a>
					
					<a class=" right carousel-control hidden-xs"href="#carousel-slider" data-slide="next">
						<i class="fa fa-angle-right"></i> 
					</a>
				</div> <!--/#carousel-slider-->
			</div><!--/#about-slider-->
		</div>
	</div>
	
	 <section id="recent-works">
        <div class="container">
<% while (img_query.next()){ %>
            <div class="row">
                <div class="col-xs-12 col-sm-4 col-md-3">
				
                    <div class="recent-work-wrap">
                        <img class="img-responsive" src="img_index/<%= (img_query.getString("img_name"))%>"alt="" >
                        <div class="overlay">
                            <div class="recent-work-inner">
                                <h3><a href="#">
								<%=(img_query.getString("explanation"))%>
								</p>
                                <a class="preview" href="img_index/<%= (img_query.getString("img_name"))%>" rel="prettyPhoto"><i class="fa fa-eye"></i> View</a>
                            </div> 
                        </div>
                    </div>
                </div>   
<% }  //ปิดรูป %>
              
    </section><!--/#recent-works-->	
	
    <section id="middle">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 wow fadeInDown">
                    <div class="skill">
                        <h2>คลีนิกยางยนต์</h2>
                        <p>คลีนิกยางยนต์เป็นบริษัทเกี่ยวข้องกับการจำหน่ายยางรถยนต์ทุกชนิด และทุกขนาด ปัจจุบัน มี 2 สาขา ยางรถยนต์ที่จำหน่าย เช่น ยางรถยนต์ทั่วไป ยางรถสิบล้อ ยางรถไถ ยางรถหกล้อ เป็นต้น </p>
<% /*$nub_per=($nub/100)*100;
	  $nub1_Cold=($nub1/100)*100;
	  $nub2_Hot=($nub2/100)*100;
	  $nub3_caa=($nub3_4/100)*100;
	  */
%>
                        <div class="progress-wrap">
                            <h3>ยางทั้งหมดในโรงงานมีทั้งหมดมี <%= pd_int%> เส้น</h3>
                            <div class="progress">
                              <div class="progress-bar  color1" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: <%= pd_int%>%">
                                <span class="bar-width">85%</span>
                              </div>

                            </div>
                        </div>

                        <div class="progress-wrap">
                            <h3>ยางอัดเย็นในโรงงานทั้งหมด <%= pd_int1%>  เส้น</h3>
                            <div class="progress">
                              <div class="progress-bar color2" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: <%= pd_int1%>%">
                               <span class="bar-width">95%</span>
                              </div>
                            </div>
                        </div>

                        <div class="progress-wrap">
                            <h3>ยางอัดร้อนในโรงงานทั้งหมด <%= pd_int2%> เส้น</h3>
                            <div class="progress">
                              <div class="progress-bar color3" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%= pd_int2%>%">
                                <span class="bar-width">80%</span>
                              </div>
                            </div>
                        </div>

                        <div class="progress-wrap">
                            <h3>ยางแกะดอกและยางเปอร์เซนในโรงงานทั้งหมด <%= pd_int3%> เส้น</h3>
                            <div class="progress">
                              <div class="progress-bar color4" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: <%= pd_int3%>%">
                                <span class="bar-width">90%</span>
                              </div>
                            </div>
                        </div>
                    </div>

                </div><!--/.col-sm-6-->

               <div class="col-sm-6 wow fadeInDown">
                    <div class="accordion">
                        <h2>ยี่ห้อยางแนะนำ</h2>
                        <div class="panel-group" id="accordion1">
                          <div class="panel panel-default">
                            <div class="panel-heading active">
                              <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseOne1">  <font color="blue"><%=res_order.getString("brand_name")%></font>
                                  <i class="fa fa-angle-right pull-right"></i>
                                </a>
                              </h3>
                            </div>

                            <div id="collapseOne1" class="panel-collapse collapse in">
                              <div class="panel-body">
                                  <div class="media accordion-inner">
                                        <div class="pull-left">
                                            <img class="img-responsive" src="image/BS.jpg">
                                        </div>
                                         <h4><%=res_order.getString("brand_name")%></h4>
                                             <p>เป็นยี่ห้อยางมาจากญี่ปุ่น ซึ่งเราประมูลโครงยางนี้ได้ จากรถเมย์ ขสมก ที่ กรุงเทพ ทีบริษัท เรามี โครงยางให้เลือกหลายประเภท หลายขนาด</p>
                                        </div>
                                  </div>
                              </div>
                            </div>
                          </div>

                          <div class="panel panel-default">

                           

                            
                            </div>
                          </div>
                        </div><!--/#accordion1-->
                    </div>
                </div>

            </div><!--/.row-->
        </div><!--/.container-->
    </section><!--/#middle--><%//มีปัญหา%>
	<%@ include file="footer.jsp" %>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/jquery.isotope.min.js"></script>   
    <script src="js/wow.min.js"></script>
	<script src="js/main.js"></script>
  </body>
</html>