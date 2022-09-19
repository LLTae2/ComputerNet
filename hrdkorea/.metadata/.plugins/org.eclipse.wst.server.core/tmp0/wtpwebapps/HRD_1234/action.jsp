<%@page import="java.sql.*" %>
<%@page import="DBPKG.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String mode = request.getParameter("mode");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String credit = request.getParameter("credit");
	String lecturer = request.getParameter("lecturer");
	String week = request.getParameter("week");
	String start_hour = request.getParameter("start_hour");
	String end_hour = request.getParameter("end_hour");
	try {
		Connection conn = Util.getConnection();
		String sql = "";
		PreparedStatement pstmt = null;
		switch(mode) {
		case "insert":
			sql = "insert into course_tbl values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, credit);
			pstmt.setString(4, lecturer);
			pstmt.setString(5, week);
			pstmt.setString(6, start_hour);
			pstmt.setString(7, end_hour);
			pstmt.executeUpdate();
%>
<jsp:foward page = "insert.jsp"></jsp:foward>
<%
		break;
case "modify":
	sql = "update course_tl set name=?, credit=?, lecturer=?, week=?, start_hour=?, end_hour=? where id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, name);
	pstmt.setString(3, credit);
	pstmt.setString(4, lecturer);
	pstmt.setString(5, week);
	pstmt.setString(6, start_hour);
	pstmt.setString(7, end_hour);
	pstmt.executeUpdate();
%>
<jsp:foward page = "modify.jsp"></jsp:foward>
<%
		break;
case "delete":
	sql="delete from course_tbl where id=? ";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.executeUpdate();

%>
<jsp:foward page="list.jsp"></jsp:foward>
<%
	break;
	}
}
catch(Exception e) {
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>