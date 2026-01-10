<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>

	<script src="https://js.tosspayments.com/v1"></script>
	<script type="text/javascript">
		var clientKey = 'test_ck_0RnYX2w532zRbgPnXnOM3NeyqApQ'
		var tossPayments = TossPayments(clientKey)
		let isFinished = false;
		window.onload = function goPay(){
			isFinished = true;
			tossPayments.requestPayment('카드', {
		          amount: "${price}",
		          orderId: "${orderNo}",
		          orderName: "${orderName}",
		          customerName: "${customerName}",
		          
		          successUrl: "${successUrl}",
		          failUrl: "${failUrl}"
		        })
		}
		window.onfocus = function () {
		    if (isFinished) {
		      // 결제창 닫힘 → 메인으로 이동
		      location.href = "Index";
		    }
		  };
	</script>
</head>
<body>
	
</body>
</html>