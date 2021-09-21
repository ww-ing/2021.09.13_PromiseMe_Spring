<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="myctx" value="${pageContext.request.contextPath}"/>  
  
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
                        		<a class="btn btn-primary" href="#yaksokCalendarModal" data-toggle="modal">일정</a>
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
                            	<label for="hp">요청사항</label>
                            	<p><textarea name="rcontent" cols="55" rows="5"></textarea></p>
                            </div>
                            <div class="form-group" align="center">
                            	<button class="btn btn-primary btn-block">약속하기</button>
                            	<button class="btn btn-danger" 
                            	data-dismiss="modal">닫기</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>