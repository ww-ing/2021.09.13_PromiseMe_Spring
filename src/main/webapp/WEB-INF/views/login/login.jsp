<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<c:import url="/top"/>

	<script>
		function loginCheck(){
			
			//아이디 입력 체크
			if(!loginF.userid.value){
				alert('아이디를 입력하세요')
				loginF.userid.focus();
				return false;
			
			//비밀번호 입력 체크
			}else if(!loginF.pwd.value){
				alert('비밀번호를 입력하세요')
				loginF.pwd.focus();
				return false;
			}
			return true;
	
		}
	</script>
	
   	<h1 class="text-center text-primary m-4">로그인</h1>
	   <div class="row">
		<div class="col-md-4 offset-md-4">
	   		<form name="loginF" action="login" method="post"
	   		onsubmit="return loginCheck()">
	   			<table class="table table-bordered">
	   				
	   				<!--아이디  -->
					<tr>
						<th>아이디</th>
						<td>
						<input type="text" name="userid" value="${uid}"
						class="form-control" autofocus="autofocus"
						placeholder="ID">
						</td>
					</tr>
					
					<!--비밀번호  -->
					<tr>
						<th>비밀번호</th>
						<td>
						<input type="password" name="pwd" 
						class="form-control"
						placeholder="Password">
						</td>
					</tr>
	   				
	   				<tr>
	   					<td colspan="2" class="text-right">
	   						<label for="saveId" class="form-check">
	   							<input type="checkbox" 
	   							${checked}
	   							name="saveId" id="saveId">
	   							아이디 저장
	   						</label>
	   					</td>
	   				</tr>
	   				
	   				<!--버튼  -->
	   				<tr>
	   					<td colspan="2" class="text-center">
	   						<button class="btn btn-primary">Login</button>
	   						<button type="reset" class="btn btn-danger ">다시쓰기</button>	
	   					</td>
	   				</tr>
	   			</table>
	   		</form>
	   	</div>
	</div>   
<c:import url="/foot"/>