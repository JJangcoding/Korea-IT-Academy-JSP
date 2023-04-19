<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
		 function send(f){
	            let name = f.name.value.trim();
	            let age = f.age.value;
	            let tel = f.tel.value;

	            //유효성 체크
	            if (name == ''){
	                alert("이름을 입력하세요홍~");
	                f.name.focus();//name 속성의 input 에게 커서를 옮긴다
	                return;
	            }//if

	            if(age ==''){
	                alert("나이를 입력하려무나~");
	                f.age.focus();
	                return;
	            }//if

	            f.action = "t_param.jsp";
	            f.submit();
	        }

		</script>
		
		
	</head>
	<body>
		<form>
			이름<input name = "name"><br>
			나이<input name = "age"><br>
			전화<input name = "tel"><br>
			<input type = "button" value = "파라미터 전송" onclick = "send(this.form);">
		</form>
	</body>
</html>