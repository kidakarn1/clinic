<%@ page import="java.sql.*" %> 
<%@page pageEncoding="UTF-8"%>
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">    <body>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">ล็อกอิน</h4>
                    </div>
                    <br>
                    <form class="form-horizontal" method="post" action="login.jsp">
                        <div class="form-group">
                            <label for="Username" class="col-sm-3 control-label">ชื่อผู้ใช้</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="Username" name="username" placeholder="Username">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="pass" class="col-sm-3 control-label">รหัสผ่าน</label>
                            <div class="col-sm-8">
                                <input type="password" class="form-control" id="pass" name="password"placeholder="Password">
                            </div>
                        </div>

                       

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">

                                <button type="submit" class="btn btn-primary">เข้าสู่ระบบ</button>
                            </div>
                        </div>


                        <div class="modal-footer">
                            <form method="post" action="register.php">




							<a href="#register"class="btn btn-success"data-toggle="modal" data-target="#register">สมัครสมาชิก</a>
                            <button type="close" class="btn btn-danger"class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">ยกเลิก</button>
                            </form>
                        </div>
                </div>
            </div>
        </div>
    </body>
</html>
<%@ include file="fromregister.jsp" %>