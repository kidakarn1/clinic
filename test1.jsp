<%@page pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%><!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>Document</title>
 </head>
 <body>
 <form method="post" action="">
 <h2 id="n1"></h2>
 <h2 id="n2"></h2>
 <h2 id="n3"></h2>
 <h1 id="showajax"></h1> 
 <input type="text" name="" id="name">
 <input type="button" name="div1" value="ลองดูๆ"><h2></h2>
<!-- <button id="div2">div2</button> -->
 </form>
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/jquery.isotope.min.js"></script>   
    <script src="js/wow.min.js"></script>
	<script src="js/main.js"></script>
	<script>
$(document).ready(function(){
$("input[name=div1]").click(function(){
$("#n1").load("test2.jsp")
	})
$("input[name=div1]").click(function(){
$("#n2").load("test2.jsp") 
	})
})
	</script>
 <script type="text/javascript" src="jquery-1.7.2.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
     $("input[name=div1]").click(function(){
 $.post("test2.jsp", { 
      data1: $("#name").val(),
	  data2: $("#name").val()	  
	  }, 
      function(data){
  $("#showajax").html(data);
      }
  );

     });
});
</script>
 </body>
</html>
