<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="myctx" value="${pageContext.request.contextPath}"/>  
  
		<!-- Modal Dialog -->
		<div id="asd">
		
		</div>
        <div class="modal" id="yaksokReserveCalendarModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="text-primary" style="margin:auto">일정 선택</h4>
                    </div>
					
                    <!-- Modal Body -->
                    <div class="modal-body">
                        
                        <!--  -->
    					<div id="calendarForm" >
    					</div>
    					<!--  -->
    					
                        <div class="form-group" align="center">
                        	<button class="btn btn-primary"
                        	 onclick="test()">선택하기</button>
                        	<button class="btn btn-danger" 
                        	data-dismiss="modal">닫기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>