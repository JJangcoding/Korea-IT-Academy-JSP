<%@page import="vo.SawonVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.SawonDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//SawonDAO dao = SawonDAO.getInstance();
	//List<SawonVO> sawon_list = dao.selectList();
	

	List<SawonVO> sawon_list = SawonDAO.getInstance().selectList();
	
	
%>







<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<caption>사원목록</caption>
		<tr>
			<th>사원번호</th>
			<th>사원이름</th>
			<th>부서번호</th>
			<th>직책</th>
			<th>입사일</th>		
		</tr>
		
		<% for(SawonVO vo: sawon_list) {%>
		<tr>
			<td><%= vo.getSabun() %></td>
			<td><%= vo.getSaname() %></td>
			<td><%= vo.getDeptno() %></td>
			<td><%= vo.getSajob() %></td>
			<td><%= vo.getSahire() %></td>
		</tr>
		<%} %>





	</table>
</body>
</html>