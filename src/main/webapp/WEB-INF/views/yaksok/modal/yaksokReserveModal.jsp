<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="myctx" value="${pageContext.request.contextPath}"/>  
<script>

	/* 일정 버튼 클릭 시 */
	function openReserveCalendarModal(){
		$.ajax({
			type:'get',
			url:'yaksokReserveCalendarModal',
			data:$('form').serialize(),
			cache:false,
			dataType:'html'
			
		}).done(function(res){
			
			$('#yaksokReserveCalendarModal').html(res);
			$('#yaksokReserveCalendarModal').modal('show');
		})
		.fail(function(err){
			alert('error: '+err.status);
		})
	}
	//-------------------------------------------------약속 캘린더
	
	/* yaksokCalendarEdit.jsp의 선택 버튼 클릭 시 */
	function yaksokCalendarSelect(cidx){
		alert('일정 선택 완료')
		$('#cidx').val(cidx);
		yaksokCalendarEditModalHide();
	}
	
	/* yaksokCalendar.jsp의 닫기 버튼 클릭 시 */
	function closeReserveCalendar(){
		$('#yaksokReserveCalendarModal').hide();
		
	}
	
	/* yaksokCalendar.jsp의 yaksokCalendarEditModal.jsp의 모달 보여주기 */
	function yaksokCalendarEditModalShow(){
    	$('#yaksokCalendarEditModal').modal('show')
    } 
	
	/* yaksokCalendar.jsp의 yaksokCalendarEditModal.jsp의 모달 숨기기 */
	function yaksokCalendarEditModalHide(){
    	$('#yaksokCalendarEditModal').modal('hide')
    }
	
	/* yaksokCalendar.jsp의 일정 클릭 시 yaksokCalendarEditModal.jsp의 모달에 데이터 전달하고 보여주기 */
	function editCalendar(yidx,cidx){
    	
    	$.ajax({
    		type:'get',
    		url:'yaksokCalendarEditModal?yidx='+yidx+'&&cidx='+cidx,
    		cache:false,
    		dataType:'html'
    		
    	}).done(function(res){
    		$('#yaksokCalendarEditModal').html(res)
    		yaksokCalendarEditModalShow();
    	}) 
    	.fail(function(err){
    		alert('error: '+err.status);
    	})
    	
    }
	
	/* yaksokCalendar.jsp의 yaksokCalendarEditModal.jsp의 모달 일정 수정하기*/
	function yaksokCalendarEdit(){
		
		$.ajax({
			type:'get',
			url:'yaksokCalendarEdit',
			data:$('form').serialize(),
			cache:false,
			dataType:'html'
			
		}).done(function(res){
			alert('수정 완료')
			yaksokCalendarEditModalHide();
			$('#yaksokMenu').html(res) 
		})
		.fail(function(err){
			alert('error: '+err.status);
		})
		
	}
	
	/* yaksokCalendar.jsp의 yaksokCalendarEditModal.jsp의 모달 일정 삭제하기 */
	function yaksokCalendarDelete(cidx,yidx){
		
		$.ajax({
			type:'get',
			url:'yaksokCalendarDelete',
			data:$('form').serialize(),
			cache:false,
			dataType:'html'
			
		}).done(function(res){
			alert('삭제 완료')
			yaksokCalendarEditModalHide();
			$('#yaksokMenu').html(res) 
		})
		.fail(function(err){
			alert('error: '+err.status);
		})
	}
</script>
		<!-- Modal Dialog -->
        <div class="modal" id="yaksokReserveModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="text-primary" style="margin:auto">약속해줘 예약</h4>
                    </div>
					
                    <!-- Modal Body -->
                    <div class="modal-body">
                        <form action="yaksokReserve" method="post">
                        	<input type="hidden" name="url" value="${url}">
                        	<c:if test="${onoffData.calendaronoff eq 1 }">
                        	<div class="form-group" align="right">
                        		<a class="btn btn-primary" onclick="openReserveCalendarModal()">일정</a>
                        	</div>
                        	</c:if>
                        	<input type="hidden" name="yidx" value="${info.yidx}">
                        	<input type="hidden" name="yaksokurl" value="${info.yaksokurl}">
                            <div class="form-group">
                                <label for="username">이름</label>
                                <input type="text" autofocus="autofocus" 
                                class="form-control" name="rusername" placeholder="성함">
                            </div>
                    
                            <div class="form-group">
                                <label for="rhp">전화번호</label>
                                <input type="text" class="form-control" name="rhp"
                                maxlength="11" placeholder="숫자만 입력">
                            </div>
                            
                            <div class="form-group">
                            	<label for="rcontent">요청사항</label>
                            	<p><textarea name="rcontent" cols="53" rows="5"></textarea></p>
                            </div>
                            
                            <c:if test="${onoffData.calendaronoff eq 1 }">
                            <div class="form-group">
                                <input type="text" autofocus="autofocus" id="cidx"
                                class="form-control" name="cidx" placeholder="상단의 일정을 선택해주세요" readonly value="${cidx}">
                            </div>
                            <br>
                            </c:if>
                            <!-- 버튼 -->
                            <div class="form-group" align="center">
                            	<button class="btn btn-primary btn-block">약속하기</button>
                            	<button class="btn btn-danger" 
                            	data-dismiss="modal">닫기</button>
                            </div>
                            
                        </form>
                        <div class="modal"id="yaksokReserveCalendarModal">
                        
                        </div>
                    </div>
                </div>
            </div>
        </div>