<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../mall/main_top.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

alcoholDetail.jsp
<br>

<script type="text/javascript">
function goOrder(num){ //넘어오는거 잊지마~
	//alert(1);
	orderqty = f.orderqty.value;
	
	if(orderqty =="" || f.orderqty.value <= 0){ //숫자가 없거나 음수를 넣으면 
		alert('상품갯수는 1개이상 입력해야합니다.');
		location.href="main.mall";
		return; //이거없으면 밑으로 감.. 꼭! 잊지마
	}
	location.href='orderList.mall?num='+num+'&orderqty='+orderqty;
}
</script>

<%=application.getRealPath("/resources")%><br>
<%=application.getContextPath()%><br>
<%=request.getContextPath()%><br>

<!-- 추천 버튼이 눌렸을 때 -->

<center>
	<h1>상품 상세보기 화면</h1>
	<form name="f" action="add.mall" method="post" >
	<table border="1" width="500" height="400" class="table table-hover">
		<input type="hidden" name="num" value="${ ab.num }">
		<input type="hidden" name="pageNumber" value="${pageNumber }">
		<tr>
			<td rowspan=7><img src="/resources/${ab.image}"></td>
			<td align=center>상품명</td>
			<td>&nbsp;${ab.name}</td>
		</tr>
		<tr>
			<td>가격</td>
			<td>&nbsp;${ab.price }</td>
		</tr>
		<tr>
			<td>상품 코드</td>
			<td>&nbsp;${ab.code }</td>
		</tr>
		<tr>
			<td>제조사</td>
			<td>&nbsp;${ab.brand }</td>
		</tr>
		<tr>
			<td>제조국가</td>
			<td>&nbsp;${ab.country }</td>
		</tr>
		<tr>
			<td>수량</td>
			<td><input type="text" name="orderqty" value=""></td>
		</tr>
		<td><input type="button" value="찜"></td>
		<td>
		<input type="submit" value="장바구니">
		<input type="button" value="바로 결제" onclick="goOrder(${ab.num})"></td>
	</table>
	</form>
	<br> <br>

	<table border="1" width="500" height="400">


		<tr>
			<td>
				<form method="post" action="/reWrite.al">
					<input type="hidden" name="num" value="${ab.num}"> <input
						type="hidden" name="ref" value="${ab.num}"> <select
						name="star">
						<option value="5" selected>매우만족</option>
						<option value="4">만족</option>
						<option value="3">보통</option>
						<option value="2">불만족</option>
						<option value="1">매우불만족</option>
					</select>
					<textarea name="content"></textarea>
					<input type="submit" value="리뷰등록">
				</form>
			</td>


		</tr>



	</table>

	<br> <br>

	<table border="1" width="500" height="400">

		<c:forEach var="item" items="${rb}">
			<tr>
				<td>별점 : ${item.star} <br> 날짜 : ${item.reg_date}
				</td>

				<td>내용 : ${item.content} <br> <br> 추천 :
					<p id="recomm">${item.readcount}<p>

					<button id="recommbtn" data-id="${item.num}"
						onclick="recommAjax(this);">추천</button>
				</td>
			</tr>
		</c:forEach>



	</table>
</center>

<script>
	function recommAjax(event) {
		$.ajax({
			url : '/recomm.al',
			data : {
				id : $(event).data('id')
			},
			type : 'GET',
			dataType: 'json',
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8', 
			success : function(resp) {
				console.log(resp.message);

				if (resp.message < 1) {
					alert("통신 실패");
					return;
				} else {
					$(event).data('id', rid + 1);
				}
			}

		})
	}
</script>



