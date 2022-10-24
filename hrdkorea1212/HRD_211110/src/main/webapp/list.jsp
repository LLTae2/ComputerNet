<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='style.css' />
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
	<h3>강사조회</h3>
	<table border=''>
		<tr>
			<td>강사코드</td>
			<td>강사명</td>
			<td>강의명</td>
			<td>수강료</td>
			<td>강사자격취득일</td>
		</tr>
		<%
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/XE", "system", "1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from tbl_teacher_202201");
			while(rs.next()) {
				String date = rs.getString("teacher_regist_date");
				date = date.substring(0, 4) + "년" + date.substring(4, 6) + "월" + date.substring(6, 8) + "일";
		%>
				<tr>
					<td><%=rs.getString("teacher_code") %></td>
					<td><%=rs.getString("teacher_name") %></td>
					<td><%=rs.getString("class_name") %></td>
					<td>₩<%=rs.getInt("class_price") %></td>
					<td><%=date %></td>
				</tr>
		<%
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		%>
	</table>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>