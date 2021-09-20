<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<c:import url="/top"/>

<script>

	function check(){
		if(!f.username.value){
			alert('이름을 입력하세요');
			f.username.focus();
			return;
		}
		
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
		//비번 확인 체크
		if(!f.pwd2.value){
			alert('비밀번호 확인을 입력하세요');
			f.pwd2.focus();
			return;
		}
		//비번과 비번확인이 동일한지 여부 체크
		if(f.pwd.value != f.pwd2.value){
			alert('비밀번호 확인값이 일치하지 않습니다.');
			f.pwd2.select();
			return;
		}
		
		//연락처 입력 체크
		if(!f.hp1.value || !f.hp2.value || !f.hp3.value){
			alert('연락처를 모두 입력하세요');
			f.hp1.focus();
			return;
		}
		
		f.submit();		
		
	}//check()-----------------
	
	function idCheck(){
		if(!f.userid.value){
			alert('아이디를 입력하세요')
			return;
		}
		$.ajax({
			type:'post',
			url:'idCheck?userid='+f.userid.value,
			cache:false,
			dataType:'html'
		})
		.done(function(res){
			alert('사용가능한 아이디입니다.')
		})
		.fail(function(err){
			alert('이미 사용중인 아이디입니다.')
			$('#userid').val('');
			$('#userid').focus();
		})
	}
	
	var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
	$(function(){
		
		$('#userid').keyup(function(){
			if(!idReg.test(f.userid.value)){
				$('#id_check_danger').text('영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.');
			}else{
				$('#id_check_danger').text('');
			}
		})
		
		$('#pwd2').keyup(function(){
			if(f.pwd.value != f.pwd2.value){
				$('#pwd_check_danger').text('비밀번호 확인값이 일치하지 않습니다.');
			}
			else{
				$('#pwd_check_danger').text('');
			}
		})
	})

</script>

<div class="container">
	<h1 class="text-center text-primary m-4">회원가입</h1>
	<div class="row">
	<div class="col-md-8 offset-md-2">
	<form name="f" action="join" method="post">
		<table class="table">
			<tr>
				<td width="30%">
				<b>이름</b>
				</td>
				<td width="70%">
				<div class="row">
					<div class="col-md-6">
						<input type="text" name="username" placeholder="이름"
				 		class="form-control">
					</div>				 		
				 </div>
				</td>
			</tr>
			
			<tr>
				<td width="30%">
				<b>아이디</b>
				</td>
				<td width="70%">
				<div class="row">
					<div class="col-md-6">
						<input type="text" id="userid" name="userid" placeholder="아이디" class="form-control" maxlength="16">
						<div class="check_font text-danger" id="id_check_danger"></div>
					</div>
					<div class="col-md-4">
					  	<button type="button" onclick="idCheck()" class="btn btn-primary">중복검사</button>
					</div>	
				 </div>
				</td>
			</tr>
			
			<tr>
				<td width="30%">
				<b>비밀번호</b>
				</td>
				<td width="70%">
				<div class="row">
					<div class="col-md-6">
						<input type="password" id="pwd" name="pwd" placeholder="비밀번호"
				 		class="form-control">
				 	</div>
				 </div>
				</td>
			</tr>
			
			<tr>
				<td width="30%">
				<b>비밀번호 확인</b>
				</td>
				<td width="70%">
				<div class="row">
					<div class="col-md-6">
						<input type="password" id="pwd2" name="pwd2" placeholder="비밀번호 확인"
				 		class="form-control">
				 		<div class="check_font text-danger" id="pwd_check_danger"></div>
				 	</div>
				 </div>
				</td>
			</tr>
			<tr>
				<td width="30%">
				<b>연락처</b>
				</td>
				<td width="70%">
				<div class="row">
					<div class="col-md-3">
				<input type="text" name="hp1" maxlength="3"
				 placeholder="HP1"	 class="form-control">
					</div>
					<div class="col-md-3">
				<input type="text" name="hp2" maxlength="4" 
				placeholder="HP2"	 class="form-control">
					</div>
					<div class="col-md-3">
				<input type="text" name="hp3"  maxlength="4"
				 placeholder="HP3"	 class="form-control">
					</div>
				<div class="col-md-3">
					  <button type="button" onclick="numberCheck()" class="btn btn-primary">인증번호 받기</button>
				</div>	
					
				 </div>
				 
				 <!-- row end -->
				 
				</td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<button type="button" onclick="check()" class="btn btn-success">회원가입</button>
					<button type="reset" class="btn btn-danger">다시쓰기</button>
				</td>
			</tr>
		</table>
	</form>
	</div>
	</div>
</div>

<c:import url="/foot"/>