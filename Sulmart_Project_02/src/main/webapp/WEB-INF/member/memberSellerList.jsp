<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- sellerList.jsp<br> -->
<%@ include file="../admin/main_top.jsp" %>

<script type="text/javascript">
	function insert(){
		location.href="registerForm.mem";
	} 
/* 	
	function update(num,pageNumber){
		location.href="update.mem?num="+num+"&pageNumber="+pageNumber;
	}
	 */
</script>

<br>
<hr>
    
<center>
<h2><b>회원 관리</b></h2>

<hr>

   <form action="list.mem" method="get">
	   	<select name="whatColumn">
	   		<option value="">전체검색</option>
	   		<option value="name">닉네임</option>
	   		<option value="id">ID</option>
	   	</select>
	   	<input type="text" name="keyword">
	   	<input type="submit" value="검색">
   </form>
   	<table class="table table-hover" style="width: 80%">
   		<tr>
   			<td colspan="13" align="right">
   			<input type="button" value="추가하기" onClick="insert()">
   			</td>
   		</tr>
   		
   		<tr>
   			<td colspan="13" align="right">
   			<a href="list.mem">일반 회원</a> | 
			판매자 회원
   			</td>
   		</tr>
   		
   		<tr bgcolor="#B2EBF4">
   			<td>닉네임</td>
   			<td>아이디</td>
   			<td>비밀번호</td>
   			<td>이메일</td>
   			<td>생년월일</td>
   			<td>휴대폰 번호</td>
   			<td>주소</td>
   			<td>수정</td>
   			<td>삭제</td>
   		</tr>
		<c:forEach var="m" items="${lists }">
	   		<tr>
	   			<td>${m.name }</td>
	   			<td><a href="detail.mem?num=${m.num }&pageNumber=${pageInfo.pageNumber}">${m.id}</a></td>
	   			<td>${m.password }</td>
	   			<td>${m.email }</td>
	   			<td>${m.rrn1 }-${m.rrn2 }</td>
	   			<td>${m.hp1}-${m.hp2}-${m.hp3}</td>
	   			<td>${m.zipcode1 } ${m.zipcode2 } ${m.zipcode3 }</td>
	   			<%-- <td><input type="button" value="수정" onclick="update('${m.num}','${pageInfo.pageNumber }')"></td>
	   			 --%>
	   			<td><a href="updatego.mem?num=${m.num }&pageNumber=${pageInfo.pageNumber}">수정</a></td>
	   			<td><a href="delete.mem?num=${m.num }&pageNumber=${pageInfo.pageNumber}">삭제</a></td>
	   		</tr>
   		</c:forEach>
   	</table>
   	</center>
   	<center>
   	${pageInfo.pagingHtml }
   	</center>

<%@ include file="../mall/main_bottom.jsp" %>