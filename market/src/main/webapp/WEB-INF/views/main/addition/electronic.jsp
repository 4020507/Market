<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
div#page{list-style: none; float: left; padding: 6px; width:33%}

</style>
<ul>
	<li>Categories</li>
	<li><a href="/main/product/view">All</a></li>
	<li><a href="/main/product/toys">Toys</a></li>
	<li><a href="/main/product/clothes">Clothes</a></li>
	<li><a href="/main/product/fruits">Fruits</a></li>
	<li><a href="/main/product/electronics">Electronics</a></li>
	<li><a href="/main/product/shoes">Shoes</a></li>
	<br></br>
	<br></br>
	<br></br>
	<font size="1em">
	<br></br>
		<c:if test="${pageNumber.p.getPage() > 1}">
			<a href="electronics?page=${pageNumber.p.getPage() - 1}"> << </a>
		</c:if>
		<c:if test="${pageNumber.p.getPage() <= 1}">
			<a href="electronics??page=${pageNumber.p.getPage()}"> << </a>
		</c:if>
		<c:if test="${pageNumber.p.getPage() <= 2 && Math.ceil(pageNumber.getTotal()/3) >= 5}">
			<c:forEach var="idx" begin = "1" end = "5">			    
				<c:if test="${pageNumber.p.getPage() != idx}">
				   <a href="electronics${pageNumber.pages(idx)}">${idx}</a>
				 </c:if>
				 <c:if test="${pageNumber.p.getPage() == idx}">
				   	<a href="electronics${pageNumber.pages(idx)}" style = "color:#c62cd4;">${idx}</a>
				  </c:if>
			</c:forEach>
		</c:if>
			    <c:if test="${pageNumber.p.getPage() <= 2 && Math.ceil(pageNumber.getTotal()/3) < 5}">
				    <c:forEach var="idx" begin = "1" end = "${Math.ceil(pageNumber.getTotal()/3)}">			    
				    	<c:if test="${pageNumber.p.getPage() != idx}">
				    		<a href="electronics${pageNumber.pages(idx)}">${idx}</a>
				    	</c:if>
				    	<c:if test="${pageNumber.p.getPage() == idx}">
				    		<a href="electrnoics${pageNumber.pages(idx)}" style = "color:#c62cd4;">${idx}</a>
				    	</c:if>
				    </c:forEach>
			    </c:if>
			    <c:if test="${Math.ceil(pageNumber.getTotal()/3) == 0}">
				    <c:forEach var="idx" begin = "1" end = "1">			    
				    	<c:if test="${pageNumber.p.getPage() != idx}">
				    		<a href="electronics${pageNumber.pages(idx)}" style = "color:#c62cd4;">${idx}</a>
				    	</c:if>
				    	<c:if test="${pageNumber.p.getPage() == idx}">
				    		<a href="electrnoics${pageNumber.pages(1)}" style = "color:#c62cd4;">1</a>
				    	</c:if>
				    </c:forEach>
			    </c:if>
			    <c:if test="${pageNumber.p.getPage() > 2 && (pageNumber.p.getPage() + 2) <= Math.ceil(pageNumber.getTotal()/3)}">
				    <c:forEach var="idx" begin = "${pageNumber.p.getPage()  - 2}" end = "${pageNumber.p.getPage()  + 2}">			 
				    	<c:if test="${pageNumber.p.getPage() != idx}">
				    		<a href="electronics${pageNumber.pages(idx)}">${idx}</a>
				    	</c:if>
				    	<c:if test="${pageNumber.p.getPage() == idx}">
				    		<a href="electronics${pageNumber.pages(idx)}" style = "color:#c62cd4;">${idx}</a>
				    	</c:if>
				    </c:forEach>
			    </c:if>
			    
			     <c:if test="${pageNumber.p.getPage() > 2 && pageNumber.p.getPage() + 2 > Math.ceil(pageNumber.getTotal()/3)}">
				    <c:forEach var="idx" begin = "${pageNumber.p.getPage()  - 2}" end = "${Math.ceil(pageNumber.getTotal()/3)}">			    
				    	<c:if test="${pageNumber.p.getPage() != idx}">
				    		<a href="electronics${pageNumber.pages(idx)}">${idx}</a>
				    	</c:if>
				    	<c:if test="${pageNumber.p.getPage() == idx}">
				    		<a href="electronics${pageNumber.pages(idx)}" style = "color:#c62cd4;">${idx}</a>
				    	</c:if>
				    </c:forEach>
			    </c:if>
			    <c:if test="${pageNumber.p.getPage() < Math.ceil(pageNumber.getTotal()/3)}">
			    	<a href="electronics?page=${pageNumber.p.getPage() + 1}"> >> </a>
				</c:if>
				<c:if test="${pageNumber.p.getPage() == Math.ceil(pageNumber.getTotal()/3) || Math.ceil(pageNumber.getTotal()/3) == 0}">
			    	 <a href="electronics?page=${pageNumber.p.getPage()}"> >> </a>
				</c:if>
		</font>
	<li><a href="/main/product/write">글쓰기</a></li>
</ul>