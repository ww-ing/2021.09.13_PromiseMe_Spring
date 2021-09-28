<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:import url="/top"/>

<script>
	let win = null;
	
	let openWin = function(){
		win = window.open("idCheck.jsp","idCheck",
				"width=400, height=400, left=100, top=100");
	}



	let check = function(){
		//이름 체크
		if(!f.username.value){
			alert('이름을 입력하세요');
			f.username.focus();
			return;
		}
		
		//아이디 체크
		if(!f.userid.value){
			alert('아이디를 입력하세요');
			f.userid.focus();
			return;
		}
		//비번 체크
		if(!f.pwd.value){
			alert('비밀번호를 입력하세요');
			f.pwd.focus();
			return;
		}
		//비번과 비번확인이 동일한지 여부 체크
		if(f.pwd.value!=f.pwd2.value){
			alert('비밀번호와 비밀번호 확인값이 달라요');
			f.pwd2.focus();
			return;
		}
		
		//연락처 입력 체크
		if(!f.hp1.value || !f.hp2.value || !f.hp3.value ){
			alert('연락처를 모두 입력하세요');
			f.hp1.focus();
			return;
		}
		
		f.submit();
		
	}//check()---------
	
</script>

<div class="container">
    <h1 class="text-center text-primary m-4">내정보</h1>
	<form name="f" action="myInfoEdit" method="post">
		<!--  ------------------------>
		<input type="hidden" name="idx" value="${user.idx}">
		<!--  hidden date------------------------>
		<table class="table">
		
			<tr>
				<td width="10%">
				<b>이름</b>
				</td>
				<td width="80%">
				<input type="text" name="username" value="${user.username}" placeholder="Name"
				class="form-control">
				</td>
			</tr>
			
			<tr>
				<td width="10%">
				<b>아이디</b>
				</td>
				<td width="80%">
				<div class="row">
					<div class="col-md-8">
					<input type="text" name="userid" value="${user.userid}" placeholder="User ID"
					readonly class="form-control">
					</div>
				</div>
				</td>
			</tr>
			
			<tr>
				<td width="10%">
				<b>비밀번호</b>
				</td>
				<td width="50%">
				<input type="password" name="pwd" placeholder="Password"
				class="form-control">
				</td>
			</tr>
			
			<tr>
				<td width="10%">
				<b>비밀번호 확인</b>
				</td>
				<td width="50%">
				<input type="password" name="pwd2" placeholder="Re Password"
				class="form-control">
				</td>
			</tr>
			
			<tr>
				<td width="10%">
				<b>연락처</b>
				</td>
				<td width="80%">
				<div class="row">
					<div class="col-md-3">
				<input type="text" name="hp1" value="${user.hp1}" maxlength="3" 
				placeholder="HP1" class="form-control">
					</div>
					<div class="col-md-3">
				<input type="text" name="hp2" value="${user.hp2}" maxlength="4" 
				placeholder="HP2" class="form-control">
					</div>
					<div class="col-md-3">
				<input type="text" name="hp3" value="${user.hp3}" maxlength="4" 
				placeholder="HP3" class="form-control">
					</div>
				</div>
				<!--  row end -->
				</td>
			</tr>
			
			<tr>
				<td width="10%">
				<b>회원상태</b>
				</td>
				<td width="10%">
				
				
				<input type="radio" name="mstate" value="0" placeholder="Name" ${mstate1}>일반회원
				
				<input type="radio" name="mstate" value="1" placeholder="Name" ${mstate2}>정지회원
				
				<input type="radio" name="mstate" value="-1" placeholder="Name" ${mstate3}>탈퇴회원
				
				</td>
			</tr>			
			
			<tr>
				<td colspan="2" class="text-center">
					<button type="button" onclick="check()" class="btn btn-success">수정하기</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<c:import url="/foot"/>