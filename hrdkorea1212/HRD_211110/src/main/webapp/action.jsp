<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='java.sql.*' %>
<% 
request.setCharacterEncoding("UTF-8");
String month = request.getParameter("month");
String member_code = request.getParameter("code");
String place = request.getParameter("place");
String lecture = request.getParameter("lecture");
String price = request.getParameter("price");
String teacher_code = "";
System.out.println("400000".getClass().getName());
if(lecture == "100000")teacher_code = "100";
if(lecture == "200000")teacher_code = "200";
if(lecture == "300000")teacher_code = "300";
if(lecture == "400000")teacher_code = "400";
else teacher_code = "500";
try {
	
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/XE", "system", "1234");
	String sql = "insert into tbl_class_202201 values(?, ?, ?, ?, ?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, month);
	pstmt.setString(2, member_code);
	pstmt.setString(3, place);
	pstmt.setString(4, price);
	pstmt.setString(5, teacher_code);
	
	pstmt.executeUpdate();
}
catch(Exception e) {
	e.printStackTrace();
}
	
%>