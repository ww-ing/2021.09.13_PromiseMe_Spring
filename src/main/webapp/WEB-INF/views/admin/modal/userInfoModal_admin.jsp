<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<script>
	/* 회원상태 수정을 위한 라디오 버튼 hide */
	$('#mstateRadio').hide();
	
	/* 회원상태 수정 버튼 */
	function showEditMstate(){
		
		if($('#showEditButton').text() == '회원상태 수정'){
			$('#mstateRadio').show();
			$('#showEditButton').text('접기');
		}else{
			$('#mstateRadio').hide();
			$('#showEditButton').text('회원상태 수정')
		}
		
	}
	
	function editMstate(){
		
		$.ajax({
			type:'post',
			url:'mstateEdit_admin',
			cache:false
		}).done(function(res){
			alert('수정 완료')
			
		})
		.fail(function(err){
			alert('error: '+err.status);
		})
		
	}
</script>
    
		<!-- Modal Dialog -->
        <!-- <div class="modal" id="yaksokCalendarEditModal"> -->
            <div class="modal-dialog" style="">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="text-primary" style="margin:auto">${userInfo.username} 님의 상제정보</h4>
                    </div>
					
                    <!-- Modal Body -->
                    <div class="modal-body">
                        <form name="" action="listAdmin" method="get">
                        	<input type="hidden" name="idx" value="${userInfo.idx}">
                        	<input type="hidden" name="cpage" value="${cpage}">
                            <div class="form-group">
                                <label for="username">이름</label>
                                <input type="text" autofocus="autofocus" readonly
                                class="form-control" name="username" value="${userInfo.username}">
                            </div>
                            
                            <div class="form-group">
                                <label for="hp">번호</label>
                                <input type="text" autofocus="autofocus" readonly
                                class="form-control" name="hp" value="${userInfo.hp1}-${userInfo.hp2}-****">
                            </div>
                            
                            <div class="form-group">
                            	<label for="indate">가입 날짜</label>
                            	<input type="text" autofocus="autofocus" readonly
                            	class="form-control" name="indate" value="${userInfo.indate}">
                            </div>
                            
                            <div class="form-group">
                            	<label for="yaksokCount">총 약속 수</label>
                            	<input type="text" autofocus="autofocus" readonly
                            	class="form-control" name="yaksokCount" value="${yaksokCount}">
                            </div>
                            
                            <div class="form-group">
                            	<label for="mstate">회원 상태</label>
                            	<input type="text" autofocus="autofocus" readonly
                            	class="form-control" name="" 
                            	value="<c:if test="${userInfo.mstate eq '0' }">활동회원</c:if><c:if test="${userInfo.mstate eq '1' }">정지회원</c:if><c:if test="${userInfo.mstate eq '-1' }">탈퇴회원</c:if>">
                            	<a class="btn btn-primary" onclick="showEditMstate()" id="showEditButton">회원상태 수정</a>
                            </div>
                            <div class="btn-group btn-group-toggle" data-toggle="buttons" id="mstateRadio">
                            
                            	<c:if test="${userInfo.mstate eq '-1'}">
                            	탈퇴회원 입니다.
                            	<input type="hidden" name="mstate" value="-1">
                            	</c:if>
                            	
                            	<c:if test="${userInfo.mstate ne '-1'}">
                            	
                            	<label>정지 해제</label>
                            	<input type="radio" name="mstate" value="0"
                            	 
                            	<c:if test="${userInfo.mstate eq '0'}">
                            	checked
                            	</c:if>
                            	>
                            	<label>회원 정지</label>
                            	<input type="radio" name="mstate" value="1"
                            	 
                            	<c:if test="${userInfo.mstate eq '1'}">
                            	checked
                            	</c:if>
                            	>
                            	<button 
                            	data-dismiss="modal">수정</button>
                            	</c:if>
                            </div>
                               
                            <div class="form-group" align="center">
                            	<!-- <a class="btn btn-primary btn-block" href="#" onclick="userInfoModal_adminHide()">닫기</a> -->
                            	<button class="btn btn-danger" 
                            	data-dismiss="modal">닫기</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        <!-- </div> -->
        <!-- ---------- -->