<%@ page import="java.sql.*" %> 
<%@page pageEncoding="UTF-8"%>
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">    <body>
      <div class="modal fade" id="register" tabindex="-1" role="dialog" aria-labelledby="register">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="register">กรอกข้อมูลส่วนตัว</h4>
                </div>
                <br>
                <form class="form-horizontal"action="insertmember.jsp" >		
                    <div class="form-group">
                        <label for="fname" class="col-sm-2 col-md-2 control-label">ชื่อ:<font color="#ff0000">*</font></label>
                        <div class="col-sm-3 col-md-3">
                            <input type="text" class="form-control"  name="fname" maxlength="250"id="name" required >
                            <p id="spname"></p>
                        </div>

                        <label for="lname" class="col-sm-2 control-label">นามสกุล:<font color="#ff0000">*</font></label>
                        <div class="col-sm-3 col-md-3">
                            <input type="text" class="form-control" id="surname" name="lname" maxlength="250"id="surname" required>
                            <p id="spsurname">
                        </div>

                    </div>


  <div class="form-group">
                        <label for="sex" class="col-sm-2 control-label">เพศ</label>
                        <div class="col-sm-8">
                            <input type="radio"name="sex"value="ชาย"id="sex">ชาย
                            <input  type="radio"name="sex"value="หญิง"id="sex">หญิง
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="line" class="col-sm-2 control-label">ไลน์</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="line" name="line"maxlength="250" required>
                        </div>
						<label for="facebook" class="col-sm-2 control-label">เฟสบุ๊ค</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="pass" name="facebook"maxlength="250" required>
                        </div>
                    </div>


 <div class="form-group">
                        <label for="phone" class="col-sm-2 control-label">เบอร์โทรศัพท์</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="phone" name="phone"maxlength="250" required>
                        </div>
                    </div>



                    <div class="form-group">
                        <label for="address" class="col-sm-2 control-label">ที่อยู่:<font color="#ff0000">*</font></label>
                        <div class="col-sm-8">
                            <textarea  class="form-control"  name="address"maxlength="1000" required>
	</textarea>
                        </div>

                    </div>


                    <div class="form-group">
                        <label for="brithday" class="col-sm-2 control-label">วันเกิด</label>
                        <div class="col-sm-8">
                            <input type="date" class="form-control" id="pass" name="brithday"placeholder="Birthday" required>
                        </div>
                    </div>

                

                    <div class="modal-footer">

                        <input class="btn btn-success" type="submit" value="สมัครสมาชิก">
                         <button type="close" class="btn btn-danger"class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">ยกเลิก</button>

                    </div>

                    <br>        
                </form>

            </div>
        </div>
    </div>
    </body>
</html>