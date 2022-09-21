<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
mallSearchView.jsp<br>
<%@ include file="main_top.jsp" %>

<center>

	<h2>상품 조회</h2>

	<!-- 상품 -->
	<table class="table table-hover">
		<c:if test="${ fn:length(lists) eq 0 }">
			<tr>
				<td align="center">등록된 상품이 없습니다.</td>
			</tr>
		</c:if>

		<tr>
			<c:forEach var="alcohol" items="${ lists }" varStatus="i">
				<td><img
					src="<%=request.getContextPath()%>/resources/${alcohol.image}"
					width="200" height="200"><br> ${ alcohol.name }<br>
					${ alcohol.price }원</td>

				<c:if test="${ i.count % 4 == 0 }">
		</tr>
		<tr>
			</c:if>
			</c:forEach>
		</tr>
	</table>

	${ pageInfo.pagingHtml }

</center>

<%@ include file="main_bottom.jsp" %>