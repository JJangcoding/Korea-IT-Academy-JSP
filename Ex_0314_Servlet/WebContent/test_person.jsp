<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="VO.PersonVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- Model1 구조: 하나의 jsp파일에서 자바의 연산코드와 html의 디자인 코드를 모두 작성하는 형태 -->

<%
	PersonVo p1 = new PersonVo();
	p1.setName("홍길1");
	p1.setAge(20);
	p1.setTel("010-111-1111");
	
	PersonVo p2 = new PersonVo();
	p2.setName("홍길2");
	p2.setAge(23);
	p2.setTel("010-222-2222");
	
	PersonVo p3 = new PersonVo();
	p3.setName("홍길3");
	p3.setAge(3);
	p3.setTel("010-333-3333");
	
	//준비해둔 vo객체들을 ArrayList에 탑재
	List<PersonVo> pList = new ArrayList<>();
	pList.add(p1);
	pList.add(p2);
	pList.add(p3);
	
	
%>
 	<table border="1">
 		<caption>개인정보 목록</caption>
      <tr>
        <th>이름</th>
        <th>나이</th>
        <th>전화번호</th>
      </tr>
       <% for (int i = 0; i < pList.size(); i++) {%>
         <tr>
            <td><%= pList.get(i).getName()%></td>
            <td><%= pList.get(i).getAge()%></td>
            <td><%= pList.get(i).getTel()%></td>
         </tr>
       <%}%>
      

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>