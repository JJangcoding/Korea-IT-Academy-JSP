<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.TestVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <% Map<String, Object> map = new HashMap<>();
       map.put("name", "홍길동");
       map.put("age", 20);
       map.put("tall", 167.2);
       
       request.setAttribute("myMap", map);
       
       //request영역에 VO를 저장하고 출력
       TestVO vo1 = new TestVO();
       vo1.setName("홍길동");
       vo1.setAge(22);
       
       TestVO vo2 = new TestVO();
       vo2.setName("김길동");
       vo2.setAge(26);
       
       request.setAttribute("vo", vo1);
       
       //ArrayList에 담긴 vo들의 정보를 출력
       List<TestVO> list = new ArrayList<>();
       list.add(vo1);
       list.add(vo2);
       request.setAttribute("arr", list);
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이름 : ${myMap.get("name")}<br>
	나이 : ${myMap['age'] }<br>
	키 : ${myMap.tall } => 가장많이 사용하는 방법
	
	<hr>
	
	이름: ${ 	vo.name }<br>
	나이: ${ vo.age }
	
	<hr>
	
	${ arr[0].name} / ${arr[0].age }<br>
	${ arr[1].name} / ${arr[1].age }<br>
	
</body>
</html>