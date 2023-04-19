<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" %>
<%
  //t_param.jsp?name=홍길동&age=30&tel=010-3333-3333
  
  //post방식으로 파라미터가 전달 되었을 때, 값에 한글이 섞여있다면 깨져서 표기된다
  //이를 해결하기 위해 request를 통해 메서드를 정의해 줘야 한다
  request.setCharacterEncoding("utf-8");

  String name = request.getParameter("name");
  String tel = request.getParameter("tel");
  int age = Integer.parseInt(request.getParameter("age"));
%>

<html>
<head>
    <title>Title</title>
   <meta charset= "UTF-8">
</head>
<body>
<table border="1">
  <tr>
    <th>이름</th>
    <td><%= name %></td>
    <th>나이</th>
    <td><%= age %></td>
    <th>전화</th>
    <td><%= tel %></td>

  </tr>
</table>

</body>
</html>