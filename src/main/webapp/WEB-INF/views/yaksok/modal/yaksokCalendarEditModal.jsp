<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
		<!-- Modal Dialog -->
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="text-primary" style="margin:auto">일정수정</h4>
                    </div>
					
                    <!-- Modal Body -->
                    <div class="modal-body">
                        <form name="yaksokCalendarAddModalForm" action="#" method="post">
                        	<input type="hidden" name="cidx" value="${cidx}">
                        	<input type="hidden" name="yidx" value="${yidx}">
                            <div class="form-group">
                                <label for="ctitle">제목</label>
                                <input type="text" autofocus="autofocus" 
                                class="form-control" name="ctitle" value="${ctitle}">
                            </div>
                            
                            <div class="form-group">
                            	<label for="ccontent">설명</label>
                            	<p><textarea name="ccontent" cols="53" rows="5">${ccontent}</textarea></p>
                            </div>
                               
                            <div class="form-group" align="center">
                            	<a class="btn btn-primary btn-block" href="#" onclick="yaksokCalendarEdit()">수정</a>
                            	<a class="btn btn-primary btn-block" href="#" onclick="yaksokCalendarDelete()">삭제</a>
                            	<button class="btn btn-danger" 
                            	data-dismiss="modal">닫기</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>