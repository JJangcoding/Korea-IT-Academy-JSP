<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <!-- 현재 페이지와 같이 servlet을 통한 DB조회와 결과 출력을 나눠서 작업하는 구조를 mode12(MVC패턴) 구조라고 한다
    M(Model) : DAO
    V(View)	: jsp
    C(Controller) : Servlet -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Ajax사용을 위한 js를 등록해둔다  -->
<script src = "js/httpRequest.js"></script>

<script>
	function del (idx){
		
		//location.href = 'del.do?idx='+idx
				
		if( !confirm("정말 삭제하시겠습니까?")){
			return;
		}
		
		//idx를 Ajax를 통해서 서버측으로 전달
		var url = "member_del.do";
		var param = "idx="+idx;
		
		sendRequest(url, param, resultFn, "GET");
		
	}

	function resultFn(){
		//콜백 메서드
		if( xhr.readyState == 4 && xhr.status == 200){
			
			var data = xhr.responseText;
			//data --> "no" or "yes"
			
			if ( data == 'yes'){
				alert("삭제성공");
				//location.href="member_list.do";
				history.go(0);
			}else{
				alert("삭제실패. 관리자에게 문의하세요");
			}
			
		}
		
	}
</script>





</head>
<body>
	<table border="1">
		<caption>:::회원목록:::</caption>
		
		<tr>
			<td colspan="7">
				<input type = "button" value="회원가입" onclick="location.href = 'member_insert_form.jsp'">
			</td>
		</tr>
		
		<tr>
			<th>회원번호</th>
			<th>이름</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이메일</th>
			<th colspan = "2">주소</th>
		</tr>
		
		<c:forEach var="vo" items="${ list }">
		<tr>
			<td>${ vo.idx }</td>
			<td>${ vo.name }</td>
			<td>${ vo.id }</td>
			<td>${ vo.pwd }</td>
			<td>${ vo.email }</td>
			<td>${ vo.addr }</td>
			<td>
				<input type ="button" value = "삭제" onclick="del('${vo.idx}')">
			</td>
		
		</tr>
		
		</c:forEach>
		
		
		
	</table>
	
</body>
</html>