<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
insertForm.jsp<br>
<%@ include file="../mall/main_top.jsp" %>

<center>

	<h2>카테고리 관리</h2>

<div>
	<form action="insertAlCate.ad">
		<table>
		<caption>주류 카테고리 등록</caption>
			<tr>
				<td><input type="text" name="cate" value="">&nbsp;
				<input type="submit" value="등록"></td>
			</tr>
		</table>
	</form>

	<form>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>카테고리</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="allist" items="${ allists }" varStatus="i">
			<tr>
				<td>${ i.count }</td>
				<td>${ allist.cate }</td>
				<td><a href="deleteAlCate.ad?num=${ allist.num }">삭제</a></td>
			</tr>
		</c:forEach>
	</table>
	</form>
</div>

<div>
	<form action="insertSnCate.ad" method="post">
		<table>
		<caption>안주 카테고리 등록</caption>
			<tr>
				<td>
				<select name="cate1">
					<option value="건식">건식
					<option value="습식">습식
				</select>
				</td>
				<td><input type="text" name="cate2" value="">&nbsp;
				<input type="submit" value="등록"></td>
			</tr>
		</table>
	</form>


	<table border="1">
		<tr>
			<th>번호</th>
			<th>카테고리1</th>
			<th>카테고리2</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="snlist" items="${ snlists }" varStatus="i">
			<tr>
				<td>${ i.count }</td>
				<td>${ snlist.cate1 }</td>
				<td>${ snlist.cate2 }</td>
				<td><a href="deleteSnCate.ad?num=${ snlist.num }">삭제</a></td>
			</tr>
		</c:forEach>
	</table>
</div>

</center>

<%@ include file="../mall/main_bottom.jsp" %>