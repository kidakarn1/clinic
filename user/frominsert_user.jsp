<%@ page import="java.sql.*" %> 
<%@page pageEncoding="UTF-8"%>
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">    <body>
 <div class="modal fade" id="brand" tabindex="-1" role="dialog" aria-labelledby="brand">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="brand">กรอกข้อมูล</h4>
                </div>
                <br>
                <form class="form-horizontal" method="get" action="../user/inserti_user_sql.jsp" >		
                    <div class="form-group">

                        <label for="image" class="col-sm-2 control-label">ชื่อผู้ใช้:<font color="#ff0000">*</font></label>
                        <div class="col-sm-3 col-md-8">
                            <input type="text" class="form-control" id="surname" name="username" maxlength="250"id="surname">
                            <p id="spsurname">
                        </div>

                    </div>

					 <div class="form-group">

                        <label for="image" class="col-sm-2 control-label">รหัสผ่าน:<font color="#ff0000">*</font></label>
                        <div class="col-sm-3 col-md-8">
                            <input type="text" class="form-control" id="surname" name="password" maxlength="250"id="surname">
                            <p id="spsurname">
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="explanation" class="col-sm-2 control-label">สถานะ<font color="#ff0000">*</font></label>
                        <div class="col-sm-8">
			<select name="status">
				<option value="admin" selected>เจ้าหน้าที่</option>
				<option value="user">ผู้ใช้</option>
			</select>
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