 <%@ page import="java.sql.*" %> 
<%@ page pageEncoding="utf8" %>
 <%
 Connection connection = null; 
 try{
		
	 	//สร้างตัวแปรเชื่อมต่อ ฐานข้อมูล mysql
		String connectionURL = "jdbc:mysql://localhost:3306/cny_data"; 
		// ประกาศตัวแปร connection  
		// Load driver mysql 
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		connection = DriverManager.getConnection(connectionURL, "root","12345678");
		if(!connection.isClosed()){
			//out.println("Successfully connected");
			//connection.close();
		}
			
 }
 catch (Exception ex){
	out.println("connected error : "+ex);	
 }
 %>
