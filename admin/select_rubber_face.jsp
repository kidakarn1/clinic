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
ResultSet rub_id = null;
ResultSet res_cid = null;
try{
	 request.setCharacterEncoding("UTF-8");
	 Statement stmt_cat = connection.createStatement();
	 String sql_cat="";
	 String sql="";
	 sql_cat="select * from rubber_face";
		if (sName!=null){
			sql="Select * from rubber_face where rub_id like '"+'%'+sName+'%'+"' or rub_name like '"+'%'+sName+'%'+"'";
		}
		else{
		sql="select * from rubber_face";
		}
	    rub_id=stmt_cat.executeQuery(sql);

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
				
                <%@ include file="menu_admin.jsp" %>
            </div><!--/.container-->
        </nav><!--/nav-->
		
    </header><!--/header-->

	<section id="services" class="service-item">
	   <div class="container">
	   <div class="col-md-offset-3 col-sm-5 col-md-4">
				</div>
            <div class="row">
				  
                <div class="  col-sm-6 col-md-12">
				<h2>จัดการหน้ายาง</h2>
                    <div class="media services-wrap wow fadeInDown">
					<div class="col-md-offset-9 col-md-8">
					<form method="post" action="" class="form-inline">
						<input class="form-control"type="text" name="sName"  placeholder="ค้นหา">
						<input class="btn btn-sm w3-green" type="submit" value="ค้นหา">
					</form>
					</div>
					<%
	String sql_cid=null;
	String bd=null;
	 if(cid!=null){
	 Statement stmt_cid = connection.createStatement();
	 sql_cid="select * from rubber_face where rub_id='"+cid+"'";
	 res_cid=stmt_cid.executeQuery(sql_cid);
	 res_cid.next();
	 bd=res_cid.getString("rub_id");
	 %>
<style>
div.absolute {
    position: absolute;
    top: 80px;
    right: 0;
    }
</style>
	    <div class="modal-dialog absolute" id="mm" role="document" >
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" id="up" class="close" data-dismiss="modal-dialog" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="ebrand">แก้ไขข้อมูล</h4>
                </div>
                <br>
                <form class="form-horizontal"action="../rubber_face/updaterubber_face_sql.jsp" >		
 
 <div class="form-group">
                        <label for="explanation" class="col-sm-2 control-label">รหัส:<font color="#ff0000">*</font></label>
                        <div class="col-sm-8">
   <input type="text" class="form-control" id="surname"  name="id" value="<%=(res_cid.getString("rub_id"))%>" maxlength="250" id="surname">
                            <p id="spsurname">
                        </div>

                    </div>
<div class="form-group">

                        <label for="image" class="col-sm-2 control-label">ชื่อ:<font color="#ff0000">*</font></label>
                        <div class="col-sm-3 col-md-8">
                            <input type="text" class="form-control" id="surname" name="name" maxlength="250"id="surname"  value="<%=(res_cid.getString("rub_name"))%>">
                            <p id="spsurname">
                        </div>

                    </div>


                    <div class="form-group">
                        <label for="explanation" class="col-sm-2 control-label">รายละเอียด:<font color="#ff0000">*</font></label>
                        <div class="col-sm-8">
   <input type="text" class="form-control" id="surname" name="detail" maxlength="250"id="surname" value="<%=(res_cid.getString("detail"))%>">
                            <p id="spsurname">
                        </div>

                    </div>

                    <div class="modal-footer">
                        <input class="btn btn-success" type="submit" id="ok"value="ตกลง">
						 <input class="btn btn btn-danger" type="button" id="up1"value="ยกเลิก">
                    </div>

                    <br>        
                </form>
            </div>
        </div>
		<%}//ปิด if ตึ๋ง%>
					<table class="table">
					<tr>
					<td bgcolor="#ffcc99">รหัส</td>
					<td bgcolor="#ffcc99">ชื่อ</td>
					<td bgcolor="#ffcc99">รายละเอียด</td>
					<td bgcolor="#ffcc99">จัดาการข้อมูล</td>
					</tr>
					<% while(rub_id.next()){%>
                        
							<tr>
							<td><%= (rub_id.getString("rub_id"))%>
                        </td>
						<td><%= (rub_id.getString("rub_name"))%>
						</td>
						<td><%= (rub_id.getString("detail"))%>
						</td>
						<td>
						

<a href="select_rubber_face.jsp?cid=<%= (rub_id.getString("rub_id"))%>"><i class="fa fa-pencil" style="font-size:20px;color:#660000;"></i></a>


						<a href="../rubber_face/delete.jsp?id=<%= (rub_id.getString("rub_id"))%>" onclick="return confirm('คุณแน่ใจหรือไม่ที่จะลบข้อมูล?');"><i class="fa fa-trash-o" style="font-size:20px;color:red;"></i></a>
                        </td>
						</tr>
						

<%
}
%>
</table>
<a type="" class=" col-md-3 btn btn-sm w3-indigo"data-toggle="modal" data-target="#brand"><font color="#ffffff"size="3">เพิ่มข้อมูล</font></a>
</div>
</div>
</div>
<!--
	<form method="post" action="">
		<input type="text" name="b" value="<%= cid%>">		<input class="btn btn-success" type="button" name="test"id="test"value="test">

		<h3>kkljlk</h3>  ajax-->
	</form>
	</section><!--/#feature-->
	<%@ include file="../rubber_face/frominsert_arubber_face.jsp"%>
	<%//@ include file="../rubber_face/fromeditrubber_face.jsp"%>
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

					<a href="../rubber_face/delete.jsp?id=` + id + ` " onclick="return confirm('คุณแน่ใจหรือไม่ที่จะลบข้อมูล?');"><i class="fa fa-trash-o" style="font-size:20px;color:red;"></i></a>
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