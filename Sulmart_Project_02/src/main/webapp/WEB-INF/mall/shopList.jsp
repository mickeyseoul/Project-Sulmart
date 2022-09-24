<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="main_top.jsp" %>

<!-- shopList.jsp<br> -->
<%@ include file="myPage_top.jsp"%>

	<div class="col-10">
	
<style>
	table{
		width : 80%;
	}     	
</style>
 <hr>
<br>
<center>
	<h2>주문 내역</h2>
</center> 
<hr>

	<table border="1" align="center" class="table table-hover">
		<tr class="table-light">
			<td colspan="5"> ${loginInfo.name } (${loginInfo.id }) 님의 주문내역 </td>
		</tr>
	
		<tr align="center" class="table-info">
			<td ><b>주문 번호 </b></td>
			<td><b>주문 일자 </b></td>
			<td ><b>리뷰</b></td>
			<td ><b>주문상태</b></td>
			<td ><b>주문취소</b></td>
		</tr>
		
<c:forEach var="ob" items="${ lists }" >
		<tr align="center"  class="table-light">
			<td >
				${ob.orderid} 			
			</td>
			<td>
				<a href="detailView.mall?orderid=${ob.orderid}">
				<fmt:parseDate var="parsedDate" value="${ob.orderdate}" pattern="yyyy-MM-dd HH:mm"/>
				<fmt:formatDate var="newFormattedDateString" value="${parsedDate}" pattern="yyyy-MM-dd HH:mm"/> 
					${newFormattedDateString}
				</a>  			
			</td>
		<td>리뷰 후기작성사이트 이동</td>	
		<td>${ob.orderState}</td>	
		<td>
		<c:if test="${ob.orderState == '배송준비'}">	
			<button type="button" class="btn btn-outline-danger" onclick="location.href='refund.mall?orderid=${ob.orderid}'">취소</button>
		</c:if>
		</td>
		</tr>	
		</c:forEach>		
	</table>

<br>
<center>	
<div class="btn-group" role="group" aria-label="Basic mixed styles example">
  <button type="button" class="btn btn-warning">${pageInfo.pagingHtml }</button>
</div>	
</center>


	</div>
	
	</div>