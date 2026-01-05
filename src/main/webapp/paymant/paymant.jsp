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
		window.onload = function goPay(){
			tossPayments.requestPayment('카드', {
		          amount: "${price}",
		          orderId: "${orderNo}",
		          orderName: "${orderName}",
		          customerName: "${customerName}",
		          
		          successUrl: "${successUrl}",
		          failUrl: "${failUrl}"
		        })
		}
	</script>
</head>
<body>
	
</body>
</html>