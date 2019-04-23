<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>

<div class="container">

<!-- Main content -->
<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">MODIFY BOARD</h3>
				</div>

				<form role="form" action="modifyPage" method="post">
					<%-- 
					<!-- 검색어 조건이 붙기 전 수정 처리 -->
					<input type='hidden' name='page' value="${cri.page}"> 
					<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
					 --%>
					<!-- 검색어 조건이 붙은 후 수정 처리 -->
					<input type='hidden' name='page' value="${cri.page }">
					<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">
					
					
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">BNO</label> 
							<input type="text" name='bno' class="form-control" value="${boardVO.bno}" readonly="readonly">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Title</label> 
							<input type="text" name='title' class="form-control" value="${boardVO.title}">
						</div>
						
						<div class="form-group">
							<label for="exampleInputPassword1">Content</label>
							<textarea class="form-control" name="content" rows="3">${boardVO.content}</textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Writer</label> 
							<input type="text" name="writer" class="form-control" value="${boardVO.writer}">
						</div>
					</div>
				</form>
				
				<div class="box-footer">
					<button type="submit" class="btn btn-primary">SAVE</button>
					<button type="submit" class="btn btn-warning">CANCEL</button>
				</div>
<script>
$(document).ready(function(){
		var formObj = $("form[role='form']");
		console.log(formObj);
		$(".btn-warning").on("click",function(){
			self.location = "/boards/list?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}";});
		$(".btn-primary").on("click",function(){
			formObj.submit();
		});
});
</script>

			</div>
		</div>
	</div>
</section>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
