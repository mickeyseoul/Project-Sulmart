<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="../common/common.jsp" %>      
main.jsp<br>
<%@ include file="main_top.jsp" %>


<table width="90%">
	<!-- 
	<tr>
		<td>뉴스레터 구독</td>
	</tr>
	 -->
	<tr>
		<td><font size="4">주류 신상품</font></td>
	</tr>
	<tr>
		<td>
			<table class="table table-hover">
				<tr>
					<c:forEach var="alcohol" items="${ lists }">
						<td>
						<a href="detail.al?num=${ alcohol.num }">
						<img src="<%=request.getContextPath()%>/resources/${ alcohol.image }" width="300" height="300">
						</a><br>
						${ alcohol.name }<br>
						${ alcohol.price }원
						</td>
					</c:forEach>
				</tr>
			</table>
		
		</td>
	</tr>
	
	<tr>
		<td height="60"></td>
	</tr>
	
	<tr>
		<td><font size="4">안주 신상품</font></td>
	</tr>
	<tr>
		<td>
			<table class="table table-hover">
				<tr>
					<c:forEach var="snack" items="${ lists2 }">
						<td>
						<a href="detail.al?num=${ snack.num }">
						<img src="<%=request.getContextPath()%>/resources/${ snack.image }" width="300" height="300">
						</a><br>
						${ snack.name }<br>
						${ snack.price }원
						</td>
					</c:forEach>
				</tr>
			</table>
		
		</td>
	</tr>
	
	<tr>
		<td><font size="4">후기</font></td>
	</tr>
	
</table>
    
<a href="main.ad">관리자 페이지</a>
<a href="recommand.mall?num=1">상품 추천</a>


<%@ include file="main_bottom.jsp" %>
    
