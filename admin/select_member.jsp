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
ResultSet mem_id = null;
ResultSet res_cid = null;
try{
	 request.setCharacterEncoding("UTF-8");
	 Statement stmt_cat = connection.createStatement();
	 String sql_cat="";
	 String sql="";
	 sql_cat="select * from member";
		if (sName!=null){
			sql="Select * from member where fname like '"+'%'+sName+'%'+"' or lname like '"+'%'+sName+'%'+"'";
		}
		else{
		sql="select * from member";
		}
	    mem_id=stmt_cat.executeQuery(sql);

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
	   <div class="col-md-offset-3 col-sm-5 col-md-7">
				</div>
            <div class="row">
				  
                <div class="col-md-offset-2  col-sm-6 col-md-9">
				<h2>จัดการสมาชิก</h2>
                    <div class="media services-wrap wow fadeInDown">
					<div class="col-md-offset-8 col-md-5">
					<form method="post" action="" class="form-inline">
						<input class="form-control"type="text" name="sName"  placeholder="ค้นหา">
						<input class="btn btn-sm w3-green" type="submit" value="ค้นหา">
					</form>
					</div>
				
					<table class="table">
					<tr>
					<td bgcolor="#ffcc99">รหัส</td>
					<td bgcolor="#ffcc99">ชื่อ</td>
					<td bgcolor="#ffcc99">นามสกุล</td>
					<td bgcolor="#ffcc99">เพศ</td>
					<td bgcolor="#ffcc99">เบอร์โทรศัพท์</td>
					<td bgcolor="#ffcc99">ไลน์</td>
					<td bgcolor="#ffcc99">เฟสบุ๊ค</td>
					<td bgcolor="#ffcc99">ที่อยู่</td>
					<td bgcolor="#ffcc99">วันเกิด</td>
					<td bgcolor="#ffcc99">จัดการ</td>
					</tr>
					<% while(mem_id.next()){%>
                        
							<tr>
							<td><%=(mem_id.getString("mem_id"))%>
                        </td>
						<td><%= (mem_id.getString("fname"))%>
						</td>
						<td><%= (mem_id.getString("lname"))%>
						</td>
						<td><%= (mem_id.getString("sex"))%>
						</td>
						<td><%=(mem_id.getString("telephone"))%>
                        </td>
						<td><%= (mem_id.getString("line_id"))%>
						</td>
						<td><%= (mem_id.getString("facebook"))%>
						</td>
						<td><%= (mem_id.getString("address"))%>
						</td>
						<td><%= (mem_id.getString("brithday"))%>
						</td>
						<td>

						

<a href="select_member.jsp?cid=<%= (mem_id.getString("mem_id"))%>"><i class="fa fa-pencil" style="font-size:20px;color:#660000;"></i></a>


						<a href="../member/delete.jsp?id=<%= (mem_id.getString("mem_id"))%>&telephone=<%= (mem_id.getString("telephone"))%>" onclick="return confirm('คุณแน่ใจหรือไม่ที่จะลบข้อมูล?');"><i class="fa fa-trash-o" style="font-size:20px;color:red;"></i></a>
                        </td>
						</tr>
						

<%
}
%>
</table>
<a type="" class=" col-md-offset-6 col-md-5 btn btn-sm w3-indigo"data-toggle="modal" data-target="#brand"><font color="#ffffff"size="3">เพิ่มข้อมูล</font></a>
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
	 sql_cid="select * from member where mem_id='"+cid+"'";
	 res_cid=stmt_cid.executeQuery(sql_cid);
	 res_cid.next();
	 bd=res_cid.getString("mem_id");
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
                <form class="form-horizontal"action="../member/updatemember_sql.jsp" >	
				<input type="hidden" name="id" value="<%=(res_cid.getString("mem_id"))%>">
                    <div class="form-group">
                        <label for="fname" class="col-sm-2 col-md-2 control-label">ชื่อ:<font color="#ff0000">*</font></label>
                        <div class="col-sm-3 col-md-3">
                            <input type="text" class="form-control"  name="fname" maxlength="250"id="name" value="<%=(res_cid.getString("fname"))%>">
                            <p id="spname"></p>
                        </div>

                        <label for="lname" class="col-sm-2 control-label">นามสกุล:<font color="#ff0000">*</font></label>
                        <div class="col-sm-3 col-md-3">
                            <input type="text" class="form-control" name="lname" 
							value="<%=(res_cid.getString("lname"))%>" maxlength="250"id="surname">
                            <p id="spsurname">
                        </div>

                    </div>


  <div class="form-group">
                        <label for="sex" class="col-sm-2 control-label">เพศ</label>
                        <div class="col-sm-8">
     <input type="radio"name="sex"value="ชาย"id="sex"  
	 <%if (res_cid.getString("sex").equals("ชาย")){
							out.print("checked");}%>>ชาย
	 <input  type="radio"name="sex"value="หญิง"id="sex" <%if(res_cid.getString("sex").equals("หญิง")){ 
	 out.print("checked");
	 }%>>หญิง
      
						</div>
                    </div>

                    <div class="form-group">
                        <label for="line" class="col-sm-2 control-label">ไลน์</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="line" name="line" value="<%=(res_cid.getString("line_id"))%>"maxlength="250">
                        </div>
						<label for="facebook" class="col-sm-2 control-label">เฟสบุ๊ค</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="pass" name="facebook" value="<%=(res_cid.getString("facebook"))%>"maxlength="250">
                        </div>
                    </div>


 <div class="form-group">
                        <label for="phone" class="col-sm-2 control-label">เบอร์โทรศัพท์</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="phone" name="phone"value="<%=(res_cid.getString("telephone"))%>"maxlength="250">
                        </div>
                    </div>



                    <div class="form-group">
                        <label for="address" class="col-sm-2 control-label">ที่อยู่:<font color="#ff0000">*</font></label>
                        <div class="col-sm-8">
                            <textarea  class="form-control"  name="address"maxlength="1000">
	<%=(res_cid.getString("address"))%>
	</textarea>
                        </div>

                    </div>


                    <div class="form-group">
                        <label for="brithday" class="col-sm-2 control-label">วันเกิด</label>
                        <div class="col-sm-8">
                            <input type="date" class="form-control" id="pass" name="brithday" value="<%=(res_cid.getString("brithday"))%>"placeholder="Birthday">
                        </div>
                    </div>

                

                    <div class="modal-footer">

                        <input class="btn btn-success" type="submit" value="ตกลง">
                     	<input class="btn btn btn-danger" type="button" id="up1"value="ยกเลิก">

                    </div>

                    <br>        
                </form>
				</div>
        </div>
		<%}//ปิด if ตึ๋ง%>
	<%@ include file="../member/frominsertmember.jsp"%>
	<%//@ include file="../member/fromeditmember.jsp"%>
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

					<a href="../member/delete.jsp?id=` + id + ` " onclick="return confirm('คุณแน่ใจหรือไม่ที่จะลบข้อมูล?');"><i class="fa fa-trash-o" style="font-size:20px;color:red;"></i></a>
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