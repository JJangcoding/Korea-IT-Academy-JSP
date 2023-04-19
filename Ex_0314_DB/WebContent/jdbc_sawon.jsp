<%@page import="vo.SawonVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	//jdbc_sawon.jsp?deptno=10
	int deptno = Integer.parseInt(request.getParameter("deptno"));
	
	
	InitialContext ic = new InitialContext();

	Context ctx = (Context)ic.lookup("java:comp/env");
	DataSource dataSource = (DataSource)ctx.lookup("jdbc/oracle_test");
	
	Connection conn = dataSource.getConnection();
	
	System.out.println("---DB연결 성공---");
	
	String sql = "select * from sawon where deptno = "+ deptno;
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	List<SawonVO> sawon_list = new ArrayList<>();
	
	while(rs.next()){
		SawonVO vo = new SawonVO();
		vo.setSabun(rs.getInt("sabun"));
		vo.setSaname(rs.getString("saname"));
		vo.setDeptno(rs.getInt("deptno"));
		vo.setSajob(rs.getString("sajob"));
		
		
		sawon_list.add(vo);
	}
	
	rs.close();
	pstmt.close();
	
	conn.close();
%>





<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<table border = "1">
			<caption>사원목록</caption>	
			
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>부서번호</th>
				<th>직책</th>
			</tr>
			
			<% for( int i =0; i < sawon_list.size(); i++){ 
					SawonVO vo = sawon_list.get(i);
					%>
					<tr>
						<td><%= vo.getSabun() %></td>
						<td><%= vo.getSaname() %></td>
						<td><%= vo.getDeptno() %></td>
						<td><%= vo.getSajob() %></td>
					<%} %>
					
					
					</tr>
			
			
		</table>
	</body>
</html>