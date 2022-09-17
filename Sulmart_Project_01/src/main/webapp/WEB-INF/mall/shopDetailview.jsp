<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
shopDetailview.jsp<br>

<style>
	table{
		width : 70%;
	}     	
</style> 

<center>
<h2>주문 상세 내역 </h2>
</center>

<table border="1" align="center">
<c:forEach var="shop" items="${lists}" varStatus="i">
	<tr align="center">
		<td>순번</td>
		<td>상품명</td>
		<td>수량</td>
		<td>단가</td>
		<td>금액</td>
	</tr>


	<tr align="center">
		<td>${i.count }</td>
		<td><img src="<%=request.getContextPath()%>/resources/${shop.image}"> &nbsp;  ${shop.name}</td>
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

<center>
<h5>주문자정보</h5>
</center>
<table border="1" align="center">

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

<center>
<h5>상품결제정보</h5>
</center>
<table border="1" align="center">

	<tr align="center">
		<td>상품합계 금액</td>
		<td>배송비</td>
		<td>할인혜택</td>
		<td>총 결제 금액</td>
		<td>결제수단</td>
	</tr>


	<tr align="center">
		<td></td> 
		<td></td>
		<td></td>
		<td>
		</td>
		<td>
			
		</td>
	</tr>


</table>