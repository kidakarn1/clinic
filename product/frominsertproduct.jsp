<%@ page import="java.sql.*" %> 
<%@page pageEncoding="UTF-8"%>
<%
ResultSet res_stmt_brand = null;
ResultSet res_stmt_cat = null;
ResultSet res_stmt_rub = null;
//ResultSet res_cid = null;
try{
	 request.setCharacterEncoding("UTF-8");
	 Statement stmt_brand = connection.createStatement();
	 String sql_brand="";
		sql_brand="select * from brand";
	    res_stmt_brand=stmt_brand.executeQuery(sql_brand);
	
	Statement stmt_cat = connection.createStatement();
	String sql_cat="";
	sql_cat="select * from category";
	res_stmt_cat=stmt_cat.executeQuery(sql_cat);

	Statement stmt_rub = connection.createStatement();
	String sql_rub="";
	sql_rub="select * from rubber_face";
	res_stmt_rub=stmt_rub.executeQuery(sql_rub);

}
 catch (Exception ex){
	out.println("connected error : "+ex);	
 }
 %>
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">    <body>
      <div class="modal fade" id="brand" tabindex="-1" role="dialog" aria-labelledby="brand">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="brand">กรอกข้อมูสินค้า</h4>
                </div>
                <br>
                <form class="form-horizontal"action="../product/insertproduct.jsp" >		
                    <div class="form-group">
                        <label for="fname" class="col-sm-2 col-md-2 control-label">รหัสสินค้า:<font color="#ff0000">*</font></label>
                        <div class="col-sm-3 col-md-3">
                            <input type="text" class="form-control"  name="id" maxlength="250"id="name">
                            <p id="spname"></p>
                        </div>

                        <label for="lname" class="col-sm-2 control-label">แบรน:<font color="#ff0000">*</font></label>
                        <div class="col-sm-3 col-md-3">
						<select name="b_id">
							<%while (res_stmt_brand.next()){%>
								<option value="<%=res_stmt_brand.getString("brand_id")%>">
								<%=res_stmt_brand.getString("brand_name")%></option>
							<%}%>
                        </select>
						</div>

                    </div>

                    <div class="form-group">
                        <label for="line" class="col-sm-2 control-label">ประเภท</label>
                        <div class="col-sm-3">
                            <select name="cat_id">
							<%while (res_stmt_cat.next()){%>
						<option  value="<%=res_stmt_cat.getString("cat_id")%>">
								<%=res_stmt_cat.getString("cat_name")%></option>
							<%}%>
                        </select>                        </div>
						<label for="facebook" class="col-sm-2 control-label">หน้ายาง</label>
                        <div class="col-sm-3">
            <select name="rub_id">
							<%while (res_stmt_rub.next()){%>
						<option  value="<%=res_stmt_rub.getString("rub_id")%>">
								<%=res_stmt_rub.getString("rub_name")%></option>
							<%}%>
                        </select>                       
                        </div>
                    </div>


 <div class="form-group">
                        <label for="phone" class="col-sm-2 control-label">ราคา</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="phone" name="price"maxlength="250">
                        </div>
                    </div>



                    <div class="form-group">
                        <label for="address" class="col-sm-2 control-label">รูป:<font color="#ff0000">*</font></label>
                        <div class="col-sm-8">
						 <input type="text" class="form-control" id="phone" name="image"maxlength="250">
                           
                        </div>

                    </div>
                    <div class="modal-footer">

                        <input class="btn btn-success" type="submit" value="ตกลง">
                         <button type="close" class="btn btn-danger"class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">ยกเลิก</button>

                    </div>

                    <br>        
                </form>

            </div>
        </div>
    </div>
    </body>
</html>