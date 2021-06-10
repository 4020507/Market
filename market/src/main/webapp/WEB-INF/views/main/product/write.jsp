	  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Market</title>
	
<script src="/resources/jquery/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
<script src="/resources/bootstrap/bootstrap.min.js"></script>
		 
</head>
<%-- this page is to add a new product --%>
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

<body>
<div id="root">
	<header id="header">
		<div id="header_box">
			<%@ include file="../addition/header.jsp" %>
		</div>
	</header>
	
	<section id="container">
		<aside>
			<%@ include file="../addition/aside2.jsp" %>
		</aside>
		<div id="container_box">
			<h2>상품 등록</h2>
			<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">

			<div class="inputArea">
			 <label for="seller">이름</label>
			 <input type="text" id="seller" name="seller"/>
			</div>
			
			<div class="inputArea">
			 <label for="pssword">비밀번호</label>
			 <input type="text" id="pssword" name="pssword" />
			</div>

			<label for="text" >카테고리</label> <select
				class="select_list" style="display: block; width: 150px;"
				id="category_code" name="category_code">
				<option value="100">Toy</option>
				<option value="200">Cloth</option>
				<option value="300">Fruit</option>
				<option value="400">Electronic</option>
				<option value="500">Shoe</option>
			</select>
			
			
			<div class="inputArea">
			 <label for="intro">내용</label>
			 <textarea rows="5" cols="50" id="intro" name="intro"></textarea>
			</div>
	
			<div class="inputArea">
			 <label for="product_price">가격</label>
			 <input type="text" id="product_price" name="product_price" />₩
			</div>
			
			<div class="inputArea">
			 <label for="image">이미지</label>
			 <input type="file" id="image" name="file" />
			 <div class="select_img"><img src="" /></div>
			 
			 <script>
			  $("#image").change(function(){
			   if(this.files && this.files[0]) {
			    var reader = new FileReader;
			    reader.onload = function(data) {
			     $(".select_img img").attr("src", data.target.result).width(500);        
			    }
			    reader.readAsDataURL(this.files[0]);
			   }
			  });
			 </script>
			</div>
			<br><%-- default button is 0 --%>
			  <input type='radio' id="state" name='state' value='0'  checked="checked"/>판매중
			  <input type='radio' id="state" name='state' value='1' />예약중
			  <input type='radio'  id="state"name='state' value='2' />판매완료
			 <br>

			<div class="inputArea">
			 <button type="button" id="add_btn" class="btn btn-secondary btn-md" onclick=button_onclick()>등록</button>
			</div>
			
			</form>
		</div>
	</section>

</div>
</body>

	<script>
	var regExp = /[^0-9]/gi;
	
	$("#product_price").keyup(function(){ numCheck($(this)); });
	
	function numCheck(selector) {
	 var tempVal = selector.val();
	 selector.val(tempVal.replace(regExp, ""));
	}
	</script>
	<%-- chcek if all data is inputed --%>
	<script>
	function button_onclick(){
		const seller = document.getElementById('seller').value;
		const pssword = document.getElementById('pssword').value;
		const category_code = document.getElementById('category_code').value;
		const intro = document.getElementById('intro').value;
		const product_price = document.getElementById('product_price').value;
		const image = document.getElementById('image').value;
		const state = document.getElementById('state').value;
		var radioVal = $('input[name="state"]:checked').val();
		
		if(seller == "" || pssword == "" || category_code == "" || intro == "" || product_price == "" ||
				image == "" || radioVal == null)
		{
			alert("닉네임 비밀번호 내용 가격 이미지 란을 모두 채워 주십시오 ");
		}
		else
			{
				var formObj = $("form[role='form']");
				formObj.attr("action", "/main/product/write");
			   formObj.attr("method", "post")
			   formObj.submit();
			}
		
	}
	</script>
</html>