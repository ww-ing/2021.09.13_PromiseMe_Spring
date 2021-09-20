<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
		<!-- Modal Dialog -->
        <div class="modal" id="yaksokAddModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="text-primary" style="margin:auto">약속 등록</h4>
                        <button class="close" data-dismiss="modal">&times;</button>
                    </div>
					
                    <!-- Modal Body -->
                    <div class="modal-body">
                        <form action="yaksokAdd" method="post">
                            <div class="form-group">
                                <label for="yaksokname">약속명</label>
                                <input type="text" autofocus="autofocus" 
                                class="form-control" name="yaksokname">
                            </div>
                            
                            <div class="form-group text-center">
                            <button class="btn btn-primary btn-block">생성</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- ---------- -->