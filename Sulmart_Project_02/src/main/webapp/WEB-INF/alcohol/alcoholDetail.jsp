<%@page import="member.model.MemberBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../mall/main_top.jsp"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<!-- 바로 결제 -->
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


<br><br>

<%-- 
alcoholDetail.jsp
<br>

<%=application.getRealPath("/resources")%><br>
<%=application.getContextPath()%><br>
<%=request.getContextPath()%><br>

 --%>
<center>
	<h1>상품 상세보기 화면</h1><br>
	<form name="f" action="add.mall" method="post">
		<input type="hidden" name="num" value="${ ab.num }">
		<input type="hidden" name="pageNumber" value="2">
	
		<table border="1" width="700" height="500" class="table table-hover">
			<tr>
				<td rowspan=7><img src="resources/images/${ab.image}" width="400px" align="center"></td>
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
				<td><input type="text" name="orderqty">
				<input type="submit" value="장바구니" class="btn btn-primary btn-sm">
				<input type="button" value="바로결제" class="btn btn-primary btn-sm" onclick="goOrder(${ab.num})">
				</td>
			</tr>
			<c:choose>
				<c:when test="${sessionScope.loginInfo eq null}">
					<tr>
						<td colspan="2" align=center>회원 구매 가능</td>
					</tr>
				</c:when>
				<c:otherwise>
								<c:choose>
									<c:when test="${ab.heart == 1 || ab.heart eq null}">
										<tr>
											<td><input type="button" id="heart" data-id="${ab.num}" onclick="HeartAjax(this);" value="찜하기" class="btn btn-primary btn-sm"></td>
											<!-- <td><input type="submit" value="장바구니" class="btn btn-primary btn-sm"></td> -->
										</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<td><input type="button" id="heartDel" data-id="${ab.num}" onclick="HeartAjax(this);"value="찜하기 취소"></input></td>
											<!-- <td><input type="submit" value="장바구니" class="btn btn-primary btn-sm"></td> -->
										</tr>
									</c:otherwise>
								</c:choose>
						
				</c:otherwise>
			</c:choose>

		</table>
		</form>
	<br> <br>
	
	<table>
		<tr>
			<td align=center width="700" height="800"><img src="/resources/${ab.image}"></td>
		</tr>
	
	</table>
	

	<table border="1" width="500" height="400" class="table table-hover">
			<tr>
				<td align=center width="800">
				<form method="post" action="/ex/reWrite.al">
					<input type="hidden" name="num" value="${ab.num}"> 
					<input type="hidden" name="ref" value="${ab.num}">
					<select name="star">
						<option value="5" selected>매우만족</option>
						<option value="4">만족</option>
						<option value="3">보통</option>
						<option value="2">불만족</option>
						<option value="1">매우불만족</option>
					</select>
					<br>
					<br>
					<textarea name="content"  style="resize: none;" cols="100" rows="9" ></textarea><br><br>
					<input type="submit" value="리뷰등록" class="btn btn-primary btn-sm" text-align="right">
				</form>
				</td>
			</tr>
	</table>

	<br> <br>

	<table border="1" width="500" height="200" class="table table-hover" align=center>

		<c:forEach var="item" items="${rb}">
			<tr>
				<td width="150">별점 : ${item.star} <br> 날짜 : ${item.reg_date}
				</td>

				<td width="350">내용 : ${item.content} <br> <br> 추천 :
					<p id="recomm">${item.readcount}</p>

					<button id="recommbtn" data-id="${item.num}"
						onclick="recommAjax(this);" class="btn btn-primary btn-sm">추천</button>
				</td>
				
<%-- 				<c:if test="${item.imagecontent ne null}">
					<td>
						<img src="resources/images/${item.imagecontent}">
					</td>
				</c:if> --%>
			</tr>
		</c:forEach>



	</table>
</center>

<script>
	/* 리뷰 */
	function recommAjax(event) {
		$.ajax({
			url : '/ex/recomm.al',
			data : {
				id : $(event).data('id')
			},
			type : 'GET',
			dataType : 'json',
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(resp) {
				if (resp.message < 1) {
					alert("통신 실패");
					return;
				} else {
					$(event).siblings("p#recomm").text(resp.newRecomm);
				}
			}
		});
	}

	/* 찜 */
	function HeartAjax(event) {
		console.log($(event).data('id'))
		$.ajax({
			url : '/ex/heart.al',
			data : {
				id : $(event).data('id')
			},
			type : 'GET',
			dataType : 'json',
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(resp) {
				if (resp.row < 1) {
					alert("통신 실패");
					return;
				} else {
					if(typeof(resp.row) != "undefined" || resp.row != null || resp.row != "") {
						alert(resp.message);	
					}
					
				}
			}
		});
	}
	
	$(document).ready(function() {
		$("input[name=orderqty]").bind('keyup mouseup',function() {
			let price = $("#price").data('price');
			let qty = $("input[name=orderqty]").val();

			$("#price").text((parseInt(price) * parseInt(qty)).toString())

		});
	})
</script>
