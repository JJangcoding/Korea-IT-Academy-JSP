<%@page import="vo.DeptVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.DeptDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	DeptDAO dao = DeptDAO.getInstance();//new => 못씀. 메모리 못잡아먹게 private로 만들었으니까.
	List<DeptVO> dept_list = dao.selectList();
%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<table border = "1">
			<tr>
				<th>부서번호</th>
				<th>부서이름</th>
				<th>부서위치</th>
			</tr>
			
			<% for ( DeptVO vo: dept_list) { %>
			
				<tr>
					<td><%= vo.getDeptno() %></td>
					<td><%= vo.getDname() %></td>
					<td><%= vo.getLoc() %></td>
					
				</tr>
				
			<%} %>
		</table>	
	</body>
</html>
