<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
shopList.jsp<br>

	<a href="logout.jsp">로그아웃</a>

<center>
	<h2>나의 주문 내역</h2><br>
</center> 

	<table border="1" align="center">
		<tr align="center">
			<td colspan="5"> ${loginInfo.name } (${loginInfo.id }) 님의 주문내역 </td>
		</tr>
	
		<tr align="center">
			<td>주문 일자 / 주문 번호 -누르면 주문자 상세 보기</td>
		<!-- 	<td>상품이미지 /상품명 -누르면 상품상세 보기</td> -->
		<!-- 	<td>상품금액/수량</td> -->
			<td>리뷰</td>
		</tr>
		
<%-- 		<c:forEach var="ob" items="${ lists }"> 	
			<c:forEach var="sb" items="${ slists }">  --%>
<c:forEach var="ob" items="${ lists }" >
<%-- <c:forEach var="sb" items="${ slists }" varStatus="status">  --%>
		<tr align="center">
			<td>
				<fmt:parseDate var="parsedDate" value="${ob.orderdate}" pattern="yyyy-MM-dd HH:mm"/>
				<fmt:formatDate var="newFormattedDateString" value="${parsedDate}" pattern="yyyy-MM-dd HH:mm"/> 
					${newFormattedDateString}
				<br>
				<a href="detailView.mall?orderid=${ob.orderid}">${ob.orderid} </a>  			
			</td>
<%--			<td>
				<a href="detail.prd?num =${slists[status.index].num }"><img src="<%=request.getContextPath()%>/resources/${slists[status.index].image}">
				 &nbsp;  ${slists[status.index].name}</a>
				
			</td>
 		<td>
			<fmt:formatNumber pattern="#,###" value="${slists[status.index].price }"/>원
			/ ${slists[status.index].qty } 개
		</td> --%>	
		<td>리뷰</td>	
		</tr>	
		</c:forEach>		
		<%-- </c:forEach>  --%>	
	</table>
