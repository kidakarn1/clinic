<%@page pageEncoding="UTF-8"%>
<%@ include file="connect.jsp"%>
<%
String username=request.getParameter("username");
String password=request.getParameter("password");
//MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
//การเข้ารหัส md 5 ตึ๋งเองจะใครล่ะ
//String pass= mdAlgorithm.update(password.getBytes());
ResultSet res = null;
ResultSet res1 = null;
String status=null;
 try{
	 Statement stmt = connection.createStatement();
	 Statement stmt1 = connection.createStatement();
	 request.setCharacterEncoding("UTF-8");
	 String sql="";
	 sql="Select * from user where username ='"+username+"' and password = '"+password+"'";
	 res=stmt.executeQuery(sql);
	 res1=stmt1.executeQuery(sql);
	 status=res.getString("status");
 }
 catch (Exception ex){
	out.println("connected error : "+ex);	
 }
 %>
<%
res.next();
	if (!res1.next()){
		%>
		<meta http-equiv="refresh" content="0; url=index.jsp?er=<%= '1'%>">
		<%}


	else if (res.getString("status").equals("user")){
		session.setAttribute("username_naja",username);
		session.setAttribute("status",res.getString("status"));
%>
<meta http-equiv="refresh" content="0; url=index.jsp">
<%
	}
 else if (res.getString("status").equals("admin")){
			session.setAttribute("username_naja",username);
			session.setAttribute("status",res.getString("status"));
	%>
<meta http-equiv="refresh" content="0; url=admin/select_brand.jsp">
<%
}
	else{
		%>
<meta http-equiv="refresh" content="0; url=index.jsp?er=<%= '1'%>">
		<%
	}
	%>

