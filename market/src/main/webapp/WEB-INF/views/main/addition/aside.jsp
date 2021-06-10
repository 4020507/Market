<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
<%-- this is an aside used for the page called 'All' --%>
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
	<div class = "page">
	<font size="1em">
	<br></br>
		<%-- when the current page is over 1, << make the page go to the one previous page --%>
		<c:if test="${pageNumber.p.getPage() > 1}">
			<a href="view?page=${pageNumber.p.getPage() - 1}"> << </a>
		</c:if>
		<%-- when the current page is 1, << make the page go to the page one --%>
		<c:if test="${pageNumber.p.getPage() <= 1}">
			<a href="view?page=${pageNumber.p.getPage()}"> << </a>
		</c:if>
		<%-- if the current page is 2 or less, and the total products numbers are less than 5, show until page 5 --%>
		<c:if test="${pageNumber.p.getPage() <= 2 && Math.ceil(pageNumber.getTotal()/3) >= 5}">
			<c:forEach var="idx" begin = "1" end = "5">			    
				<c:if test="${pageNumber.p.getPage() != idx}">
				   <a href="view${pageNumber.pages(idx)}">${idx}</a>
				 </c:if>
				 <%-- color of the current page looks different --%>
				 <c:if test="${pageNumber.p.getPage() == idx}">
				   	<a href="view${pageNumber.pages(idx)}" style = "color:#c62cd4;">${idx}</a>
				  </c:if>
			</c:forEach>
		</c:if> <%-- the case the current page is 2 or less, and we don'e need more than 5 pages, show from 1 to the max page --%>
			    <c:if test="${pageNumber.p.getPage() <= 2 && Math.ceil(pageNumber.getTotal()/3) < 5}">
				    <c:forEach var="idx" begin = "1" end = "${Math.ceil(pageNumber.getTotal()/3)}">			    
				    	<c:if test="${pageNumber.p.getPage() != idx}">
				    		<a href="view${pageNumber.pages(idx)}">${idx}</a>
				    	</c:if>
				    	<c:if test="${pageNumber.p.getPage() == idx}">
				    		<a href="view${pageNumber.pages(idx)}" style = "color:#c62cd4;">${idx}</a>
				    	</c:if>
				    </c:forEach>
			    </c:if>
			    <%-- the case 0 products, just show page 1 --%>
			    <c:if test="${Math.ceil(pageNumber.getTotal()/3) == 0}">
				    <c:forEach var="idx" begin = "1" end = "1">			    
				    	<c:if test="${pageNumber.p.getPage() != idx}">
				    		<a href="view${pageNumber.pages(idx)}" style = "color:#c62cd4;">${idx}</a>
				    	</c:if>
				    	<c:if test="${pageNumber.p.getPage() == idx}">
				    		<a href="view${pageNumber.pages(1)}" style = "color:#c62cd4;">1</a>
				    	</c:if>
				    </c:forEach>
			    </c:if>
			    <%-- the case we need to show +- 2 pages --%>
			    <c:if test="${pageNumber.p.getPage() > 2 && (pageNumber.p.getPage() + 2) <= Math.ceil(pageNumber.getTotal()/3)}">
				    <c:forEach var="idx" begin = "${pageNumber.p.getPage()  - 2}" end = "${pageNumber.p.getPage()  + 2}">			 
				    	<c:if test="${pageNumber.p.getPage() != idx}">
				    		<a href="view${pageNumber.pages(idx)}">${idx}</a>
				    	</c:if>
				    	<c:if test="${pageNumber.p.getPage() == idx}">
				    		<a href="view${pageNumber.pages(idx)}" style = "color:#c62cd4;">${idx}</a>
				    	</c:if>
				    </c:forEach>
			    </c:if>
			    
			     <c:if test="${pageNumber.p.getPage() > 2 && pageNumber.p.getPage() + 2 > Math.ceil(pageNumber.getTotal()/3)}">
				    <c:forEach var="idx" begin = "${pageNumber.p.getPage()  - 2}" end = "${Math.ceil(pageNumber.getTotal()/3)}">			    
				    	<c:if test="${pageNumber.p.getPage() != idx}">
				    		<a href="view${pageNumber.pages(idx)}">${idx}</a>
				    	</c:if>
				    	<c:if test="${pageNumber.p.getPage() == idx}">
				    		<a href="view${pageNumber.pages(idx)}" style = "color:#c62cd4;">${idx}</a>
				    	</c:if>
				    </c:forEach>
			    </c:if>
			    <c:if test="${pageNumber.p.getPage() < Math.ceil(pageNumber.getTotal()/3)}">
			    	<a href="view?page=${pageNumber.p.getPage() + 1}"> >> </a>
				</c:if>
				<c:if test="${pageNumber.p.getPage() == Math.ceil(pageNumber.getTotal()/3) || Math.ceil(pageNumber.getTotal()/3) == 0}">
			    	 <a href="view?page=${pageNumber.p.getPage()}"> >> </a>
				</c:if>
		</font>
		</div>
	<li><a href="/main/product/write">글쓰기</a></li>
</ul>