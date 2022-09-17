<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/common.jsp" %>

   <!--아임포트 결제 jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-{SDK-최신버전}.js"></script>

<script type="text/javascript">

	var IMP = window.IMP;
	IMP.init("{imp83531187}"); //가맹점 식별코드
	
	function requestPay(){	
		/* 		 
		// IMP.request_pay(param, callback) 결제창 호출
 	      IMP.request_pay({ // param
	          pg: "kakaopay", // 테스트 코드 mid:INIpayTest   ?  html5_inicis
	          pay_method: "card",
	          merchant_uid: "order_no_0001",
	          name: "노르웨이 회전 의자",
	          amount: 64900,
	          buyer_email: "gildong@gmail.com",
	          buyer_name: "홍길동",
	          buyer_tel: "010-4242-4242",
	          buyer_addr: "서울특별시 강남구 신사동",
	          buyer_postcode: "01181"
	      }, function (rsp) { // callback
	          if (rsp.success) {// 결제 성공 시 로직, */
	              alert('결제가 완료되었습니다.');
	              location.href='calculate.mall';

/* 			} else { // 결제 실패 시 로직,
	                alert('결제에 실패하였습니다.');
	          }
	      });  */
	    }		
	
</script>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap</title>

    <!-- Bootstrap -->
    <link href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/kfonts2.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    



mallList.jsp<br>
<style>
	table{
		width : 70%;
	}
	tr:first-child td{
		/* font-weight: bold; */
	}     
</style>
    
<center>
<h2>주문내역(장바구니)</h2>
</center>
<hr>

<div class="container">

<table align="center"  class="table table-bordered">
	<tr>
		<td colspan="9"  >
			주문자 정보 :  ${loginInfo.name } (${loginInfo.id }) 님의 장바구니
		</td> <!--loginInfo 로그인한사람의 정보 -->
	</tr>

	<tr align="center" class="active" >
		
		<td><b>상품 번호</b></td>
		<td><b>상품 이미지</b></td>
		<td><b>상품명</b></td>
		<td><b>수량</b></td>
		<td><b>상품금액</b></td>
		<td><b>포인트</b></td>
		<td><b>배송비</b></td>
		<td><b>합계</b></td>
		<td><b>삭제</b></td>
		
	</tr>
	<!-- List<ShioppingInfo> shopLists = new ArrayList<ShioppingInfo>(); -->
<c:forEach var="cart" items="${shopLists }"  > 
	<tr align="center">
		<td>${cart.num}</td>
		<td>
			<img height=50 width=50 
			src="<%=request.getContextPath()%>/resources/${cart.image}">  <!-- 그러면 쇼핑인포에서 목록을 더 늘려야됨?- -->
		</td>
		<td align="left">
			${cart.name}<br>
		</td>
		<td>
			<form name="f" method="post" action="cartEdit.mall">
    			<input type="hidden" name="num" value="${cart.num}" >
    			<input name="oqty" size="2" value="${cart.qty}">개 
    			<!-- pb.getPqty() 재고수량자리에 주문수량 아까 넣었음.  -->
    		<input type="submit" value="수정" class="btn btn-default btn-sm">
    		</form>		
		</td>
		<td>
			<fmt:formatNumber pattern="#,###" value="${cart.price}"/>원
		</td>
   		<td> [${cart.pointAmount }]point</td>
		<td> <fmt:formatNumber pattern="#,###" value="${cart.delivery }"/>원
		</td> 	 

		<td> <strong>
				<fmt:formatNumber pattern="#,###" value="${cart.priceAmount}"/>원
			</strong></td>  
		<td>
			<input type="button" value="삭제" class="btn btn-default btn-sm"
			onclick="location.href='cartDelete.mall?num=${cart.num}'">
		</td>
	</tr>
</c:forEach>


</table>
<br><br>




<hr>	

<br><br>

<table align="center" class="table table-bordered">
	<tr>
		<td  align="right">	
		<br>
			상품금액 : <font color="#00C6ED">
			<fmt:formatNumber pattern="#,###" value="${totalPriceAmount}"/>원 </font><br>
			<img src="./resources/images/장바구니더하기이미지.PNG" height="35"><br>
			배송비 : <font color="#00C6ED">
			<fmt:formatNumber pattern="#,###" value="${deliveryCost}"/>원<br></font>
			<img src="./resources/images/장바구니결과이미지.PNG" height="30"><br>
			합계 : <font color="#00C6ED"><b>
			<fmt:formatNumber pattern="#,###" value="${finalPrice}"/>원</b></font>
		<br><br>
		</td>
	</tr>	
	<tr>	
		<td align="right">	
			적립예정 포인트 : [${totalPointAmount}]point
		</td>
	</tr>		 

	<tr>	
		<td align="right">	
		
		<input type="button" class="btn btn-default btn-lg" value="계속 쇼핑"  onclick="location.href='list.prd'">
		<input type="button" class="btn btn-info btn-lg" value="결제하기" onclick="requestPay()">     	
     <!-- 뭘가지고 가진않고 계산하기에서 장바구니끌어다 쓰는듯? -->
		
		</td>
	</tr>			
</table>


	</div>

<!-- 
컨트롤러에서
	  HttpServletResponse response,
	  response.setContentType("text/html; charset=UTF-8");//response 응답을 보내야 한다 //내보내는 데이터에 한글처리
	
	PrintWriter writer = response.getWriter(); //writer연결다리를 타고 가서 출력	  
	writer.println("<script> alert('가입하지 않은 회원입니다'); </script>");
	writer.flush(); //alert을 내보내라는 뜻
			
	writer.println("<script> alert('비번이 일치하지 않습니다.'); </script>");
	writer.flush(); //alert을 내보내라는 뜻
 -->