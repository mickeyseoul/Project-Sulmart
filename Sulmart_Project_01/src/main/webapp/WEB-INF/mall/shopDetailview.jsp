<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="main_top.jsp" %>
shopDetailview.jsp<br>

<style>
	table{
		width : 70%;
	}     	

</style> 

 <hr>
 <br>
<center>
<h2>주문 상세 내역 </h2>
</center>
<hr>

<table border="1" align="center" class="table table-hover">
	<tr align="center">
		<td class="table-info">순번</td>
		<td class="table-info">상품명</td>
		<td class="table-info">수량</td>
		<td class="table-info">단가</td>
		<td class="table-info">금액</td>
	</tr>

<c:forEach var="shop" items="${lists}" varStatus="i">
	<tr align="center">
		<td>${i.count }</td>
		<td><img height=50 width=50 src="<%=request.getContextPath()%>/resources/${shop.image}"> &nbsp;  ${shop.name}</td>
		<td>${shop.qty}</td>
		<td>
			<fmt:formatNumber pattern="#,###" value="${shop.price}"/>원
		</td>
		<td>
			<fmt:formatNumber pattern="#,###" value="${shop.price*shop.qty}"/>원
		</td>
	</tr>
</c:forEach>
</table>

 <hr>
 <br>
<center>
<h2>주문자정보</h2>
</center>
 <hr>
<table border="1" align="center" class="table table-hover">

	<tr>
		<td>주문자 정보</td> 
		<td>
			${loginInfo.name } 
		</td> 
	</tr>
	<tr>		
		<td>배송지 </td>
		<td>
			 ${loginInfo.zipcode1 } <br> ${loginInfo.zipcode2 } <br> ${loginInfo.zipcode3 }.
		</td> 		
	</tr>	
	<tr>			
		<td>휴대폰정보 </td>
		<td>
			 ${loginInfo.hp1 } - ${loginInfo.hp2 } -  ${loginInfo.hp3 }
		</td> 		
	</tr>
	<tr>
		<td>이메일 </td>
		<td>
			 ${loginInfo.email}
		</td> 		
	</tr>

</table>

