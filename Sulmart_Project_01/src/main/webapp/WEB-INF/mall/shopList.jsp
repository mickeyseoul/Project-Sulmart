<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="main_top.jsp" %>

shopList.jsp<br>

 <hr>
 <br> 
<center>
	<h2>나의 주문 내역</h2><br>
</center> 
<hr>

	<table border="1" align="center" class="table table-hover">
		<tr >
			<td colspan="5" class="table-light"> ${loginInfo.name } (${loginInfo.id }) 님의 주문내역 </td>
		</tr>
	
		<tr align="center" >
			<td class="table-info"><b>주문 번호 </b></td>
			<td class="table-info"><b>주문 일자 </b></td>
<!--		 	<td>상품이미지 /상품명 -누르면 상품상세 보기</td> 
 		 	<td>상품금액/수량</td>  -->
			<td class="table-info"><b>리뷰</b></td>
			<td class="table-info"><b>반품신청</b></td>
		</tr>
		
<c:forEach var="ob" items="${ lists }" >
<%--  <c:forEach var="sb" items="${ slists }" varStatus="status">  --%>
		<tr align="center">
			<td>
				${ob.orderid} 			
			</td>
			<td>
				<a href="detailView.mall?orderid=${ob.orderid}">
				<fmt:parseDate var="parsedDate" value="${ob.orderdate}" pattern="yyyy-MM-dd HH:mm"/>
				<fmt:formatDate var="newFormattedDateString" value="${parsedDate}" pattern="yyyy-MM-dd HH:mm"/> 
					${newFormattedDateString}
				</a>  			
			</td>
<%--			<td>
				<a href="detail.prd?num =${slists[status.index].num }">
				<img height=50 width=50 src="<%=request.getContextPath()%>/resources/${slists[status.index].image}">
				 &nbsp;  ${slists[status.index].name}</a>
				
			</td>
	  	<td>
			<fmt:formatNumber pattern="#,###" value="${slists[status.index].price }"/>원
			/ ${slists[status.index].qty } 개
		</td> 	 --%>
		<td>리뷰 후기작성사이트 이동</td>	
		<td>
			<button type="button" value="반품신청" onclick="location.href='refund.mall?orderid=${ob.orderid}'"></button>
		</td>
		</tr>	
		</c:forEach>		
<%-- 		 </c:forEach>   --%>
	</table>
