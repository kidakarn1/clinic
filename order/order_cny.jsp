<%
String username_naja_a = String.valueOf(session.getAttribute("username_naja")); 
String status_naja = String.valueOf(session.getAttribute("status")); 
String check_free_status = String.valueOf(session.getAttribute("status1")); 
if(status_naja.equals("admin")){%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Gp Bootstrap Template</title>

    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="../css/font-awesome.min.css">
	<link href="../css/animate.min.css" rel="stylesheet">
    <link href="../css/prettyPhoto.css" rel="stylesheet">      
	<link href="../css/main.css" rel="stylesheet">
	 <link href="../css/responsive.css" rel="stylesheet">
	 <link href="../css/w3.css" rel="stylesheet">
	 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="../css/bootstrap.min.css" rel="stylesheet"> 
<%@page pageEncoding="UTF-8"%>
<%@ include file="../connect.jsp"%>
<%
String cid=request.getParameter("cid");
String sName=request.getParameter("sName");
int p1=0;
ResultSet order_id = null;
ResultSet res_cid = null;
try{
	 request.setCharacterEncoding("UTF-8");
	 Statement stmt_cat = connection.createStatement();
	 String sql_cat="";
	 String sql="";
	 sql_cat="select * from order_cny";
		if (sName!=null){
			sql="Select * from order_cny where order_id like '"+'%'+sName+'%'+"' or pro_id like '"+'%'+sName+'%'+"'";
		}
		else{
		sql="select * from order_cny";
		}
	    order_id=stmt_cat.executeQuery(sql);

}
 catch (Exception ex){
	out.println("connected error : "+ex);	
 }
 %>

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
				
                <%@ include file="../admin/menu_admin.jsp" %>
            </div><!--/.container-->
        </nav><!--/nav-->
		
    </header><!--/header-->

	<section id="services" class="service-item">
	   <div class="container">
	   <div class="col-md-offset-3 col-sm-5 col-md-7">
				</div>
            <div class="row">
				  
                <div class="col-md-offset-2  col-sm-6 col-md-9">
				<h2>การสั่งซื้อ</h2>
                    <div class="media services-wrap wow fadeInDown">
					<div class="col-md-offset-8 col-md-5">
					<form method="post" action="" class="form-inline">
						<input class="form-control"type="text" name="sName"  placeholder="ค้นหา">
						<input class="btn btn-sm w3-green" type="submit" value="ค้นหา">
					</form>
					</div>
				
					<table class="table">
					<tr>
					<td bgcolor="#ffcc99">ลำดับ</td>
					<td bgcolor="#ffcc99">รหัสสินค้า</td>
					<td bgcolor="#ffcc99">แบรน</td>
					<td bgcolor="#ffcc99">จำนวน</td>
					<td bgcolor="#ffcc99">ราคารวม</td>
					<td bgcolor="#ffcc99">รหัสสมาชิก</td>
					<td bgcolor="#ffcc99">วันที่</td>
					<td bgcolor="#ffcc99">จัดการ</td>
					</tr>
					<% while(order_id.next()){%>
                        
							<tr>
							<td><%=(order_id.getString("order_id"))%>
                        </td>
						<td><%= (order_id.getString("pro_id"))%>
						</td>
						<td><%= (order_id.getString("brand"))%>
						</td>
						<td><%= (order_id.getString("number"))%>
						</td>
						<td><%=(order_id.getString("price_sum"))%>
                        </td>
						<td><%= (order_id.getString("mem_id"))%>
						</td>
						<td><%= (order_id.getString("order_date"))%>
						</td>
						<td>	
						<a href="delete.jsp?id=<%= (order_id.getString("order_id"))%>" onclick="return confirm('คุณแน่ใจหรือไม่ที่จะลบข้อมูล?');"><i class="fa fa-trash-o" style="font-size:20px;color:red;"></i></a>
                        </td>
						</tr>
						

<%
}
%>
</table>
</div>
</div>
</div>

<!--
	<form method="post" action="">
		<input type="text" name="b" value="<%= cid%>">		<input class="btn btn-success" type="button" name="test"id="test"value="test">

		<h3>kkljlk</h3>  ajax-->
	</form>
	</section><!--/#feature-->


		<%
	String sql_cid=null;
	String bd=null;
	 if(cid!=null){
	 Statement stmt_cid = connection.createStatement();
	 sql_cid="select * from order_cny where order_id='"+cid+"'";
	 res_cid=stmt_cid.executeQuery(sql_cid);
	 res_cid.next();
	 bd=res_cid.getString("order_id");
	 %>
<style>
div.absolute {
    position: absolute;
    top: 80px;
    right: 0;
    }
</style>
	   
		<%}//ปิด if ตึ๋ง%>
	<%//@ include file="../order_cny/frominsertorder_cny.jsp"%>
	<%//@ include file="../order_cny/fromeditorder_cny.jsp"%>
	<%//@ include file="insert_basket.jsp"%>
	<%@ include file="../footer.jsp"%>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.prettyPhoto.js"></script>
    <script src="../js/jquery.isotope.min.js"></script>   
    <script src="../js/wow.min.js"></script>
	<script src="../js/main.js"></script>
  <script>
$(document).ready(function(){
    $("#up").click(function(){
		//alert("ooo");
         $("#mm").toggle();
    });
	$("#up1").click(function(){
		//alert("ooo");
         $("#mm").toggle();
    });

	$("input[name=ok]").click(function(){
		//alert("ooo");
		var id = $("input[name=id]").val()
		var name = $("input[name=name]").val()
	
		//$.post(`../brand/insertbrand_sql.jsp?b=${b}`).done()
debugger
	let obj = {
		id: id,
		name: name
	}

	$.post('../brand/insertbrand_sql.jsp', obj, function(res){
		debugger
			//document.querySelector('h3').text = res.message;
		$('h3').text(res.message);
		let [id, name] = [res.data.id, res.data.name];
	
		let td = `
			<tr>
				<td>` + id + `</td>
				<td> ` + name + ` </td>
				<td>
					<a href="select_brand.jsp?cid=` + id + `">
						<i class="fa fa-pencil"				  style="font-size:20px;color:#660000;">
						</i>
					</a>

					<a href="../order_cny/delete.jsp?id=` + id + ` " onclick="return confirm('คุณแน่ใจหรือไม่ที่จะลบข้อมูล?');"><i class="fa fa-trash-o" style="font-size:20px;color:red;"></i></a>
                </td></tr>`;

		$('table tbody').append( td );
	}, 'json')

	.fail(function(e){
		console.log(e.responseText);
	})



    });
});
</script>
  </body>
</html>
 <%}//ปิดelse บนสูดๆๆๆๆๆๆๆ ตึ๋งเองจะใครล่ะ*/
  else{%>
  <meta http-equiv="refresh" content="0; url=../index.jsp">
  <%
  }%>