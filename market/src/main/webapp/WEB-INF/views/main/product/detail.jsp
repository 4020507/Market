	  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<title>Market</title>
	<%-- this is the page to see for one product--%>
<script src="/resources/jquery/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
<script src="/resources/bootstrap/bootstrap.min.js"></script>
		 
</head>

<style>
	body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
	ul { padding:0; margin:0; list-style:none;  }
 
	div#root { width:90%; margin:0 auto; }
	
	header#header { font-size:55px; padding:15px 0; }
	header#header h1 a { color:#000; font-weight:bold; }
	
 
 	section#main { padding:15px 0; border-top:1px solid #eee; border-bottom:1px solid #eee; }
	section#main::after { content:""; display:block; clear:both; }
	div#main_inside { float:right; width:calc(100% - 200px - 20px); }
	
	aside { float:left; width:200px; }
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0;}
	aside ul li a:hover { background:#eee; } 
</style>

<style>
.replyModal{position:relative; display:none; z-index:1;}

 div.mBackground { width:100%; height:100%; position:fixed; top:0; left:0; background:rgba(0, 0, 0, 0.7); z-index:-1; }
 div.mIntro {  width:500px; height:250px; position:fixed; top:20%; left:calc(50% - 250px); background:#fff; border:2px solid #666; padding:20px 10px; }
 div.mIntro textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px; height:200px; }
 div.mIntro button { border:1px solid #ccc;  background:#fff; font-size:20px; padding:5px 10px; margin:10px 0;}
</style>

<style>
 section.replyForm { padding:30px 0; }
 section.replyForm div.reply_area { margin:0px 0; rows:10; }
 section.replyForm textarea { font-size:15px; font-family:'맑은 고딕', verdana; padding:10px; width:300px;; height:30px; }
 section.replyForm textarea.userOpinion { font-size:15px; font-family:'맑은 고딕', verdana; padding:10px; width:200px; height:30px; }
 section.replyForm button {background:#fff; padding:5px 10px; margin:10px 0; font-size:20px; border:1px solid #ccc; }
 
 section.replies { padding:30px 0; }
 section.replies ol { list-style:none; padding:0; margin:0; }
 section.replies ol li { padding:10px 0; border-bottom:2px solid #eee; }
 section.replies div.userInfo { }
 section.replies div.userInfo .userName { font-size:15px; font-weight:bold; }
 section.replies div.userInfo .date { margin-left:10px; color:#999; display:inline-block; }
 section.replies div.userOpinion { padding:10px; margin:20px 0; }
</style>

<script>
v
function replies(){
			 var product_num = ${product.product_num};
			 $.getJSON("/main/detail/showReplies" + "?num=" + product_num, function(data){
			  var str = "";
			  var total_count = 0;
			  $(data).each(function(){
			   var regDate = new Date(this.regDate);
			   var regDate2 = new Date(this.regDate);
			   <%-- date format is year, month, date, hour, minute --%>
			   regDate = regDate.toLocaleDateString("ko-KR");
			   regDate2 = regDate2.toLocaleTimeString('en-IT', { hour: '2-digit', minute:'2-digit', hour12: false });
			   
			   
			   if(product_num == this.product_num){
			   str += "<li>"
			     + "<div class='userInfo' style='padding: 0px 0px 0px 50px;'>"
			     + "<span class='userName'>" + '작성자: ' + this.userName + "</span>"
			     + "</div>"
			     + "<div class='userOpinion' style='padding: 0px 0px 0px 50px;'>" + "<span class='opinion'>" + this.userOpinion + "</span>" +
			     " <span class='date'>" + "(" + regDate + " " + regDate2 + ")" + "</span>"
			     + "<div style='text-align:right;'>" + "<span>" + "<textarea cols='20' name='inputPssword' id='inputPssword' placeholder='비밀번호'></textarea>" +"</span>"
			     + "<span>" + "<button type='button' class='modify' data-reply_num='" + this.reply_num + "'>수정</button>" +"</span>"
			     + "</div>"
			     + "</div>"
			     + "<div class='replyFooter' style='padding: 0px 0px 0px 50px;'>"
			     + "<input type='hidden' name='pssword' id = 'pssword' value=" + this.userPssword + ">"
			     + "</div>"
			     + "</li>";
			   }
			  });
			  $("section.replies ol").html(str);
			 });
}
</script>
<body>
<div id="root">
	<header id="header">
		<div id="header_inside">
			<%@ include file="../addition/header.jsp" %>
		</div>
	</header>
	<%-- show information of the product --%>
	<section id="main">
		<form role="form" method="post" autocomplete="off">
		<aside>
			<%@ include file="../addition/aside2.jsp" %>
		</aside>
		<div id="main_inside">
		<input type="hidden" name="num" value="${product.product_num}" />
		<div class="products"></div>
			<div class="productsThumbnail">
			 <img src="${product.thumbnail}" class="thumbImg"/>
			 </div>
			
			<div class="Postnumber">
			 <label for="Postnumber">Postnumber</label>
			 <span>${product.product_num}</span>
			</div>
			
			<div class="productsSeller">
			 <label for="seller">작성자</label>
			 <span>${product.seller}</span>
			</div>
			
			<div class="productsRegDate">
			 <label for="regDate">작성일</label>
			 <span><fmt:formatDate value="${product.regDate}" pattern="yyyy.MM.dd HH:mm" /></span>
			</div>
				
			<div class="productsIntro">
			 <label for="intro">상품설명</label>
			 <span>${product.intro}</span>
			</div>
	
			<div class="productsPrice">
			 <label for="product_price">가격</label>
			 <span><fmt:formatNumber value="${product.product_price}"  pattern="###,###,###"/></span> ₩
			</div>
			
			<div class="productsHit">
			 <label for="hit">조회수</label>
			 <span><fmt:formatNumber value="${product.hit}"/></span>
			</div>
		</div>
		</form>
		</section>
			<br></br>
			<br></br>
			<br></br>
			<br></br>
			<div class="inputPlace" style="padding: 350px 1px 2px 100px;">
			 댓글
			 <span>(${replyCount})</span>
			</div>
			 <section class="replies">
			 <input type="hidden" name="num" value="real_pssword" />
			 <ol>
			  </ol>
			  <script>
			  replies();
			  </script>
			<script> <%-- to modify the reply--%>
			$(document).on("click", ".modify", function(){
				//$(".replyModal").attr("style", "display:block;");
				
				 var input_check = $("#inputPssword").val();
				 var userPssword = $("#pssword").val();
				 <%-- Input the proper password --%>
				 if(input_check != userPssword)
					 {
					 	alert("비밀번호가 다릅니다.");
					 	return;
					 }
	 
				$(".replyModal").fadeIn(200);
				
				var reply_num = $(this).attr("data-reply_num");
				var userOpinion = $(this).parent().parent().children(".opinion").text();
				<%-- to modify the reply, we need reply_num --%>
				$(".modal_userOpinion").val(userOpinion);
				$(".modal_modify_btn").attr("data-reply_num", reply_num);
				$(".modal_delete_btn").attr("data-reply_num", reply_num);
				
			});
			</script>    
			</section>
			<div id="reply">
			 <section class="replyForm">
			  <form role="form" method="post" autocomplete="off">
			  <div class="reply_area" style="padding: 0px 0px 0px 100px;">
			    <textarea name="userName" cols="20" id="userName" placeholder="이름"></textarea>
			    <span><textarea name="userOpinion" rows="5" cols="40" id="userOpinion"  placeholder = "내용"></textarea></span>
			    <%-- to add reply, show modal --%>
			    <span>
			    <button type="button" id="reply_btn">등록</button>
			    <script>
					 $("#reply_btn").click(function(){
					  
					  var formObj = $(".replyForm form[role='form']");
					  var product_num = $("#product_num").val();
					  var userName = $("#userName").val();
					  var userPssword = $("#userPssword").val();
					  var userOpinion = $("#userOpinion").val();
					  
					  if(userName == "" || userPssword == "" || userOpinion == "")
					{
						alert("이름 비밀번호 내용 란을 모두 채워 주십시오 ");
						return;
					}
					  var data = {
						product_num : product_num,
						userName : userName,
						userPssword : userPssword,
					    userOpinion : userOpinion
					    };
					  
					  $.ajax({
					   url : "/main/detail/writeReply",
					   type : "post",
					   data : data,
					   success : function(){
					    replies();
					   
					   }
					  });
					 });
					</script>
					</span>
			   </div>
			   <div class="input_area" style="padding: 0px 0px 0px 100px;">
			    <textarea name="userPssword" cols="20" id="userPssword" placeholder = "비밀번호"></textarea>
			   </div>
			   
			   <div class="input_area" style="padding: 0px 0px 0px 100px;">
			    
			   </div>
			  </form>
			 </section>
			</div>
			
			<div class="inputPlace" style="float: right;">
			<form role="form" method="post" autocomplete="off">
			<input type="hidden" name="num" value="${product.product_num}" />
			 <input type="text" id="input_pssword" name="input_pssword" placeholder="게시글 비밀번호"/>
			 <button type="button" id="modifyButton" class="btn btn-warning" style="float: right;">게시글 수정</button>
			 <button type="button" id="deleteButton" class="btn btn-danger" style="float: right;">게시글 삭제</button>	
			 <script>
			  var formObj = $("form[role='form']");
			  <%-- to modify or delete the product, input corrected pssowrd --%>
			  $("#modifyButton").click(function(){
				  var input_password = document.getElementById("input_pssword").value;
				if(input_password  == "${product.pssword}"){
				   formObj.attr("action", "/main/product/modify");
				   formObj.attr("method", "get")
				   formObj.submit();
				}
				else
					{
					alert("비밀번호가 일치 하지 않습니다");
					}
			  
			  });
			  
			  $("#deleteButton").click(function(){
				  var input_password = document.getElementById("input_pssword").value;
				  if(input_password  == "${product.pssword}"){
					  formObj.attr("action", "/main/product/delete");
					   formObj.submit();
					}
					else
						{
						alert("비밀번호가 일치 하지 않습니다");
						}
			   
			  });			  
			 </script>
			</form>
			</div>
		</div>

<div class="replyModal">
 <div class="mIntro">
  
  <div>
   <textarea class="modal_userOpinion" name="modal_userOpinion"></textarea>
  </div>
  
  <div>
   <button type="button" class="modal_modify_btn">수정</button>
   <button type="button" class="modal_delete_btn">삭제</button>
  </div>
  
 </div>

 <div class="mBackground"></div>
</div>

<script>
<%-- button actions for reply delete and modify button --%>
 $(document).on("click", ".modal_modify_btn", function(){
	 var userOpinion_check = $(".modal_userOpinion").val();
	 
 
	 if(userOpinion_check==""){
		 var deletion = {
				 reply_num : $(this).attr("data-reply_num")
		 }
			
			 $.ajax({
				   url : "/main/product/replyDelete",
				   type : "post",
				   data : deletion,
				   success : function(){
					replies();
					$(".replyModal").fadeOut(200);
				   }
				 });
			
		 
		};
 
	 var data = {
	 reply_num : $(this).attr("data-reply_num"),
	 userOpinion : $(".modal_userOpinion").val()
    };
	 
	 
	 $.ajax({
		   url : "/main/product/replyModify",
		   type : "post",
		   data : data,
		   success : function(){
			replies();
			$(".replyModal").fadeOut(200);
		   }
		 });
	 
	});
 
 $(document).on("click", ".modal_delete_btn", function(){
 
		 var deletion = {
				 reply_num : $(this).attr("data-reply_num")
		 }
			
			 $.ajax({
				   url : "/main/product/replyDelete",
				   type : "post",
				   data : deletion,
				   success : function(){
					replies();
					$(".replyModal").fadeOut(200);
				   }
				 });
	 
	});
 
 </script>
 
</body>
</html>