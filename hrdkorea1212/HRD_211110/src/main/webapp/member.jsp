<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<section>
	<h3>강사조회</h3>
	<table border=''>
		<tr>
			<td>수강월</td>
			<td>회원번호</td>
			<td>회원명</td>
			<td>강의명</td>
			<td>강의장소</td>
			<td>수강료</td>
			<td>등급</td>
		</tr>
		<%
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/XE", "system", "1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from tbl_class_202201");
			while(rs.next()) {
				String grade = "";
				String date = rs.getString("teacher_code");
				if(date == "100")date = "20220101";
				if(date == "200")date = "20220102";
				if(date == "300")date = "20220103";
				if(date == "400")date = "20220104";
				String name = rs.getString("c_no");
				if(name == "10001")name = "홍길동";
				if(name == "10002")name = "장발장";
				if(name == "10003")name = "임꺽정";
				if(name == "20001")name = "성춘향";
				if(name == "20002")name = "이몽룡";
		%>
				<tr>
					<td><%=date %></td>
					<td><%=rs.getString("c_no") %></td>
					<td><%=name %></td>
					<td><%=rs.getString("class_name") %></td>
					<td><%=rs.getString("class_area") %></td>
					<td>₩<%=rs.getString("tuition") %></td>
					<td><%= %></td>
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