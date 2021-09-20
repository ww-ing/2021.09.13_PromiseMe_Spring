<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
		<!-- Modal Dialog -->
        <!-- <div class="modal" id="yaksokCalendarEditModal"> -->
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="text-primary" style="margin:auto">예약정보</h4>
                    </div>
					
                    <!-- Modal Body -->
                    <div class="modal-body">
                        <form name="yaksokReserveListUserInfoModalForm" action="#" method="post">
                        	<input type="hidden" name="yidx" value="${yidx}">
                        	<input type="hidden" name="cidx" value="${ridx}">
                            <div class="form-group">
                                <label for="rusername">이름</label>
                                <input type="text" autofocus="autofocus" readonly
                                class="form-control" name="rusername" value="${rusername}">
                            </div>
                            
                            <div class="form-group">
                                <label for="rhp">번호</label>
                                <input type="text" autofocus="autofocus" readonly
                                class="form-control" name="rhp" value="${rhp}">
                            </div>
                            
                            <div class="form-group">
                            	<label for="rindate">예약 날짜</label>
                            	<input type="text" autofocus="autofocus" readonly
                            	class="form-control" name="rindate" value="${rindate}">
                            </div>
                            
                            <div class="form-group">
                            	<label for="ccontent">설명</label>
                            	<p><textarea name="ccontent" cols="55" rows="5" readonly>${rcontent}</textarea></p>
                            </div>
                               
                            <div class="form-group" align="center">
                            	<a class="btn btn-primary btn-block" href="#" onclick="yaksokReserveListUserInfoModalHide()">닫기</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        <!-- </div> -->
        <!-- ---------- -->