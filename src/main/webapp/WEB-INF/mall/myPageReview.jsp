<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
myPageReview.jsp<br>

<%@ include file="../common/common.jsp"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<%@ include file="myPage_top.jsp"%>


<center>
	<h1>상품후기</h1>

	<table border="1" width="500" align="center">
		<tr>
			<c:forEach var="item" items="${rstatus}">
				<td class="pos" onclick="clickPosToCom(this);"
					style="background-color: #d3d3d3;">작성가능 후기(${item.possible})</td>
				<td class="com" onclick="clickPosToCom(this);">작성완료 후기(${item.complete})</td>
			</c:forEach>
		</tr>

		<!-- 해당 상품으로 이동 -->
		<!-- 마이페이지 작성 가능한 후기-> 후기쓰러가기 -->
		<c:forEach var="pb" items="${pbreview}">
			<tr id="pbview">
				<td colspan="2">
				<img src="resources/images/${pb.image}" width="150px">
					<p>${pb.name}</p>
					<p>${pb.qty}개 구매</p> <a href="/ex/detail.al?num=${pb.num}">후기쓰러가기</a></td>
			</tr>
		</c:forEach>

		<!-- 마이페이지 작성 완료한 후기 -> 상품보러가기 -->
		<c:forEach var="cm" items="${cmreview}">
			<tr id="cmview" style="display: none;">
				<td colspan="2">
				<img src="resources/images/${cm.image}" width="150px">
					<p>${cm.name}</p>
					<p>${cm.qty}개 구매</p> <a href="/ex/detail.al?num=${cm.num}">상품 보러가기</a></td>
			</tr>
		</c:forEach>

	</table>


	<br> <br>

	<h1>찜 리스트</h1>

	<table border="1" width="500" height="400">
		<tr>
			<td><input type="checkbox"></td>
			<td>상품명/옵션</td>
			<td>상품금액/수량</td>
			<td>혜택</td>
			<td>합계</td>
		<tr>
			<c:forEach var="item" items="${heartList}">
				<tr>
					
					<td><input type="checkbox"></td>
					<td><img src="resources/images/${item.contentimage}" width="150px"> ${item.name}</td>

					<td><fmt:formatNumber value="${item.price}"
							groupingUsed="true" /> / <span id="qty">1</span>개</td>



					<td>적립 <br>상품 + <fmt:formatNumber type="number"
							maxFractionDigits="0" value="${item.price * 0.1}" /></td>

					<td>
						<input type="submit" value="장바구니" class="btn btn-primary btn-sm"/> <br> 
						<input type="submit" value="삭제하기" class="btn btn-secondary btn-sm"/>
					</td>
				</tr>


			</c:forEach>
	</table>
</center>

<script>
	/* 클릭시 background-color */
	function clickPosToCom(event) {
		if ($(event).attr('class') == 'pos') {
			$('.pos').css("background-color", "#d3d3d3");
			$('.com').css("background-color", "#ffffff");
			$("tr[id^='pbview']").show();
			$("tr[id^='cmview']").hide();
		} else {
			$('.pos').css("background-color", "#ffffff");
			$('.com').css("background-color", "#d3d3d3");
			$("tr[id^='pbview']").hide();
			$("tr[id^='cmview']").show();
		}
	}
</script>

