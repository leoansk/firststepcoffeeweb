<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<div class="container">

<!-- Main content -->
<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">READ BOARD</h3>
				</div>
			
				<!-- 검색어 조건이 추가된 부분 -->
				<form role="form" action="modeifyPage" method="post">
					<input type='hidden' name='bno' value="${boardVO.bno}">
					<input type='hidden' name='page' value="${cri.page }">
					<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType }">
					<input type='hidden' name='keyword' value="${cri.keyword }">
				</form>

				<div class="box-body">
					<div class="form-group">
						<label for="exampleInputEmail1">Title</label> 
						<input type="text" name='title' class="form-control" value="${boardVO.title}" readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Content</label>
						<textarea class="form-control" name="content" rows="3" readonly="readonly">${boardVO.content}</textarea>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Writer</label> 
						<input type="text" name="writer" class="form-control" value="${boardVO.writer}" readonly="readonly">
					</div>
				</div>

				<div class="box-footer">
					<button type="submit" class="btn btn-warning modifyBtn">Modify</button>
					<button type="submit" class="btn btn-danger removeBtn">REMOVE</button>
					<button type="submit" class="btn btn-primary goListBtn">GOLIST</button>
				</div>
				
 				<!-- 검색어 조건이 추가된 부분 -->
 				<script>
					$(document).ready(function(){
						var formObj = $("form[role='form']");
						
						console.log(formObj);
						$(".btn-warning").on("click", function(){
							formObj.attr("action", "/boards/modifyPage");
							formObj.attr("method", "get");		
							formObj.submit();
						});
						$(".btn-danger").on("click", function(){
							formObj.attr("action", "/boards/removePage");
							formObj.submit();
						});
						$(".goListBtn").on("click", function(){
							formObj.attr("method", "get");
							formObj.attr("action", "/boards/list");
							formObj.submit();
						});
					});
					
				</script>
 				
			</div>
		</div>
	</div>
	
	<!-- 게시물의 댓글 처리  -->
	<div class="row">
		<div class="col-md-12">
			<!-- 댓글의 등록에 필요한 <div> -->
			<div class="box box-success">
				<br/><br/>
				
				<div class="box-header">
					<h3 class="box-title">ADD NEW REPLY</h3>
				</div>
				
				<div class="box-body">
					<label for="exampleInputEmail1">Writer</label> 
					<input class="form-control" type="text" placeholder="USER ID" id="newReplyWriter"> 
					<label for="exampleInputEmail1">Reply Text</label> 
					<input class="form-control" type="text"	placeholder="REPLY TEXT" id="newReplyText">
				</div>
				
				<!-- /.box-body -->
				<div class="box-footer">
					<button type="button" class="btn btn-primary" id="replyAddBtn">ADD REPLY</button>
				</div>
			</div>

			<!-- 댓글 목록과 페이징 처리에 필요한 div -->
			<ul class="timeline">
				<!-- timeline time label -->
				<li class="time-label" id="repliesDiv">
					<span class="bg-green">
							Replies List 
					</span>
				</li>
			</ul>

			<div class='text-center'>
				<ul id="pagination" class="pagination pagination-sm no-margin ">

				</ul>
			</div>
			
			
		</div>
	</div>


<!-- 수정과 삭제를 위한 Model창 -->
<!-- Modal -->
<div id="modifyModal" class="modal modal-primary fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"></h4>
      </div>
      <div class="modal-body" data-rno>
        <p><input type="text" id="replytext" class="form-control"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
        <button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div> 

</section>
</div>


<!-- 게시물의 댓글 처리 (handlerbars를 사용하는 템플릿 코드) -->
<!-- 화면상에서 하나의 댓글을 구성하는 부분입니다 코드의 중간에 'prettifyDate regdate'에는 handlebar의 기능을 확장하는 방법의 예로 사용되었습니다 -->
<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-rno={{rno}}>
<i class="fa fa-comments bg-blue"></i>
 <div class="timeline-item" >
  <span class="time">
    <i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
  </span>
  <h3 class="timeline-header"><strong>{{rno}}</strong> -{{replyer}}</h3>
  <div class="timeline-body">{{replytext}} </div>
    <div class="timeline-footer">
     <a class="btn btn-primary btn-xs" 
	    data-toggle="modal" data-target="#modifyModal">Modify</a>
    </div>
  </div>			
</li>
{{/each}}
</script>

<!-- 
	위의 'prettifyDate'에 대한 JavaScript 처리는 아래와 같습니다 
	handlebars는 helper라는 기능을 이용해서 데이터의 상세한 처리에 필요한 기능들을 처리합니다.
	만일 원하는 기능이 없는 경우에는 아래와 같이 registerHelper()를 이용해서 사용자가 새로운 기능을 추가할 수 있습니다.
-->

<script>
	
	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});

	var printData = function(replyArr, target, templateObject) {
		var template = Handlebars.compile(templateObject.html());
		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);

	}

	/* 위의 템플릿을 이용하는 페이지를 처리하는 JavaScript의 기능은 아래와 같다 
		getPage()는 특정한 게시물에 대한 페이징 처리를 위해서 호출되는 함수입니다. 내부적으로 jQuery를 이용해서 JSON 타입의 데이터를 처리합니다.
		var bno는 JSP에 처리되는 문자열로 해당 게시물의 번호를 의미합니다.
		선언된 변수 중 replyPage는 수정이나 삭제 작업 이후에 사용자가 보던 댓글의 페이지 번호를 가지고 다시 목록을 출력하기 위해서 유지되는 데이터입니다.
		getPage(pageInfo)는 페이지 번호를 파라미터로 전달받고, jQuery의 getJSON()을 이용해서 댓글의 목록 데이터를 처리합니다.
		댓글의 목록 데이터는 'pageMaker'와 'list'로 구성되므로 이를 printPaging()과 printData()에서 처리합니다.
	*/
	var bno = ${boardVO.bno};
	
	var replyPage = 1;

	function getPage(pageInfo) {
		$.getJSON(pageInfo, function(data) {
			printData(data.list, $("#repliesDiv"), $('#template'));
			printPaging(data.pageMaker, $(".pagination"));

			$("#modifyModal").modal('hide');
		});
	}

	var printPaging = function(pageMaker, target) {
		var str = "";
		if (pageMaker.prev) {
			str += "<li> <a href='" + (pageMaker.startPage - 1) + "'> << </a> </li>";
		}
		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li "+strClass+"> <a href='"+i+"'>" + i + "</a> </li>";
		}
		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1) + "'> >> </a> </li>";
		}
		target.html(str);
	};

	/* 최초로 댓글의 1페이지를 가져오는 작업은 사용자가 화면상에서 'Replies List'라는 버튼을 클릭했을 때 동작하도록 설계한다.
		목록의 size()를 체크하는 코드는 목록을 가져오는 버튼이 보여지는 <li>만 있는 경우에 1페이지의 댓글 목록을 가져오기 위해서 처리한 코드입니다.
	*/
	$("#repliesDiv").on("click", function() {
		if ($(".timeline li").size() > 1) {
			return;
		}
		getPage("/replies/" + bno + "/1");
	});
	
	/* 페이징 처리의 코드는 <ul class='pagination'>에서 이루어집니다 각 링크에는 <li>태그와 <a> 태그로 구성되고, 이에 대한 이벤트 처리는 아래와 같습니다 */
	$(".pagination").on("click", "li a", function(event){
		event.preventDefault();
		replyPage = $(this).attr("href");
		getPage("/replies/"+bno+"/"+replyPage);
	});
	/* ----------------------------------------- */

	$("#replyAddBtn").on("click",function(){
		 var replyerObj = $("#newReplyWriter");
		 var replytextObj = $("#newReplyText");
		 var replyer = replyerObj.val();
		 var replytext = replytextObj.val();
		  
		  $.ajax({
				type:'post',
				url:'/replies/',
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "POST" },
				dataType:'text',
				data: JSON.stringify({bno:bno, replyer:replyer, replytext:replytext}),
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("등록 되었습니다.");
						replyPage = 1;
						getPage("/replies/"+bno+"/"+replyPage );
						replyerObj.val("");
						replytextObj.val("");
					}
			}});
	});


	$(".timeline").on("click", ".replyLi", function(event){
		
		var reply = $(this);
		
		$("#replytext").val(reply.find('.timeline-body').text());
		$(".modal-title").html(reply.attr("data-rno"));
		
	});

	$("#replyModBtn").on("click",function(){
		  var rno = $(".modal-title").html();
		  var replytext = $("#replytext").val();
		  
		  $.ajax({
				type:'put',
				url:'/replies/'+rno,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "PUT" },
				data:JSON.stringify({replytext:replytext}), 
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("수정 되었습니다.");
						getPage("/replies/"+bno+"/"+replyPage );
					}
			}});
	});

	$("#replyDelBtn").on("click",function(){
		  var rno = $(".modal-title").html();
		  var replytext = $("#replytext").val();
		  $.ajax({
				type:'delete',
				url:'/replies/'+rno,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "DELETE" },
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("삭제 되었습니다.");
						getPage("/replies/"+bno+"/"+replyPage );
					}
			}});
	});
</script>

<%@include file="/WEB-INF/views/include/footer.jsp"%>
