<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/common.jsp" %>
 
memberRegisterForm.jsp<br>

<style type="text/css">
	.error{
		color: gray;
		font-size: 8;
		font-weight: bold;
		
	}
	form {
	text-align: center;
	align: center;
	margin: auto;
</style>

 <%-- 
<c:set var="path" value="${pageContext.request.conte
xtPath}"/>


 --%>
 

<c:set var="path" value="<%=request.getContextPath() %>"/>


<script type="text/javascript" src="${path}/resources/js/jquery.js"></script>

<!-- 
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>

 -->
<script type="text/javascript">

	
	function repwcheck(){
		
		if($('input[name=password]').val() != $('input[name=repassword]').val()){
			$('#pwmessage').html("<font color=red>비밀번호가 일치하지 않습니다.</font>");
			$('#pwmessage').show();
			pwsame = "nosame";
		}
		else{ // 값이 같다면
			$('#pwmessage').html("<font color=blue>비밀번호가 일치합니다.</font>");
			$('#pwmessage').show();
			pwsame = "same";
		}
	}

</script>


<body>
<h1>회원정보 수정</h1><br>
	<form:form method="post" action="update.mem" commandName="member">

		<p>
			<input type="hidden" name="num" id="num" value="${member.num }">
			<input type="hidden" name="pageNumber" value="${pageNumber }">
			<input type="hidden" name="id" id="id" value="${member.id }">
			
			<label for="id">아이디 ${member.id }</label>
			<%-- 
			<input type="text" name="id" id="id" value="${member.id }">
			<input type="button" id="id_check" value="중복체크">
			<span id="idMessage"></span>
			<form:errors cssClass="error" path="id" />
			
			 --%>
		</p>
		
		<p>
			<label for="name">닉네임 </label>
			
			<input type="text" name="name" id="name" value="${member.name }">
			<form:errors cssClass="error" path="name" />
		</p>
	
		<p>
			<label for="password">비밀번호 </label>
			<input type="password" name="password" id="password" onBlur="pwcheck()">
			<form:errors cssClass="error" path="password"/>
		</p>
	 
		<p>
			<label>비밀번호 확인 </label>
			<input type="password" name="repassword" id="repassword" onKeyup="repwcheck()">
			<span id="pwmessage" style="display:none;"></span>
		</p>
		 
		<p>
			<label for="email">이메일 </label>
			<input type="email" name="email" id="email" value="${member.email }">
			<form:errors cssClass="error" path="email"/>
		</p>
		<p>
			<label for="rrn1">성인인증 </label>
			<input type="text" name="rrn1" id="rrn1" style="width: 130px;" value="${member.rrn1 }">-
			<input type="text" name="rrn2" id="rrn2" style="width: 130px;" value="${member.rrn2 }">
			<form:errors cssClass="error" path="rrn1"/>
		</p>
		<p>
			<label for="hp1">핸드폰 </label>
			<input type="text" name="hp1" id="hp1" style="width: 80px;" value="${member.hp1 }">-
			
			<input type="text" name="hp2" id="hp2"  style="width: 90px;" value="${member.hp2 }">-
			
			<input type="text" name="hp3" id="hp3"  style="width: 90px;" value="${member.hp3 }">
			<input type="button" id="hp_button" name ="hp_button" value="본인인증"><br>
			<form:errors cssClass="error" path="hp1"/>
		</p>
		<p>
			<label for="zipcode1">배송지 </label>
			<input type="text" name="zipcode1" id="zipcode1" style="width: 90px;" value="${member.zipcode1 }">
			<input type="button" id="zipcode_w" name ="zipcode_w" value="우편번호"><br>
			
			<input type="text" name="zipcode2" id="zipcode2" style="width: 230px;" value="${member.zipcode2 }"><br>
			
			<input type="text" name="zipcode3" id="zipcode3" style="width: 230px;" value="${member.zipcode3 }">
			<form:errors cssClass="error" path="zipcode1"/>
		</p>
	
 
		<p>
			<input type="submit" value="수정하기" id="btnSubmit">
		</p>
	</form:form>
