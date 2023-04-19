<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function check(f) {
				
				//let jumin = f.jumin.value;
				
				f.action="jumin.do";
				f.submit();
			}
		</script>
		
		
	</head>
	
	<body>
		<form>
			주민번호 <input name="jumin"> 
			<input type = "button" value="확인" onclick="check(this.form);">
		</form>
	</body>
</html>