  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
	<title>Market</title>
	
<script src="/resources/jquery/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
<script src="/resources/bootstrap/bootstrap.min.js"></script>

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
	#main_inside table { width:800px; } 
	#main_inside table th { font-weight:bold; font-size:10px; padding:2px; border-bottom:2px solid #666; text-align:center;}
	#main_inside table tr:hover { background:#eee; }
	#main_inside table td { padding:10px; text-align:center; }
	#main_inside table img { width:140px; height:auto; }

.category{
	text-align:center;
	margin:10;
	font-size: 30px;
}
</style>


</head>
<body>
<div id="root">
	<header id="header">
		<div id="header_inside">
			<%@ include file="../addition/header.jsp" %>
		</div>
	</header>
	
	<section id="main">
		<aside>
			<%@ include file="../addition/electronic.jsp" %>
		</aside>
		<div id="main_inside">
			<div class = "category">
			<td>Electronics</td>
			</div>
			<table>
			 <thead>
			  <tr>
			  <td>이미지</td>
			  <th>Postnumber</th>
			   <th>이름</th>
			   <th>가격</th>
			   <th>설명</th>
			   <th>작성일</th>
			   <th>조회수</th>
			   <th>상태</th>
			  </tr>
			 </thead>
			 <tbody>
			  <c:forEach items="${list}" var="list">
			  <c:if test="${list.category_code eq '400'}">
			  <tr>
			  	<td>
				  <img src="${list.thumbnail}">
				 </td>
				 <input type="hidden" name="num" value="${list.product_num}" />
				 <input type="hidden" name="category_name" value="${list.category_name}" />
				 <input type="hidden" name="category_name" value="${list.pssword}" />
			  <td>${list.product_num}</td>
			   <td>${list.seller}</a></td>
			   <td>
					<fmt:formatNumber value="${list.product_price}"  pattern="###,###,###"/> ₩
				</td>
				<td>
				<c:choose>
			        <c:when test="${fn:length(list.intro) gt 110}">
			        <c:out value="${fn:substring(list.intro, 0, 110)}...">
			        </c:out></c:when>
			        <c:otherwise>
			        <c:out value="${list.intro}">
			        </c:out></c:otherwise>
				</c:choose>
			 	</td>
			   <td>
			   		<fmt:formatDate value="${list.regDate}" pattern="yyyy.MM.dd" />
			   </td>
			   <td>${list.hit}</td>
			   <c:if test="${list.state == 0 }">
			   <td><button type="button" id="detail_btn" onclick="location.href='/main/product/detail?num=${list.product_num}'">판매중</button></td>
			   </c:if>
			   <c:if test="${list.state == 1 }">
			   <td><button type="button" id="detail_btn" onclick="location.href='/main/product/detail?num=${list.product_num}'">예약중</button></td>
			   </c:if>
			   <c:if test="${list.state == 2 }">
			   <td><button type="button" id="detail_btn" onclick="location.href='/main/product/detail?num=${list.product_num}'">판매완료</button></td>
			   </c:if>
			  </tr>
			  </c:if>   
			  </c:forEach>
			 </tbody>
			</table>
	</section>

</div>
</body>
</html>