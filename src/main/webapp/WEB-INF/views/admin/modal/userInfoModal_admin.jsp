<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
		<!-- Modal Dialog -->
        <!-- <div class="modal" id="yaksokCalendarEditModal"> -->
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="text-primary" style="margin:auto">${userInfo.username} 님의 상제정보</h4>
                    </div>
					
                    <!-- Modal Body -->
                    <div class="modal-body">
                        <form name="userInfoModal_admin" action="listAdmin?cpage" method="get">
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