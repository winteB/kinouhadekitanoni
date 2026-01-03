<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		var clientKey = 'test_ck_0RnYX2w532zRbgPnXnOM3NeyqApQ'
		var tossPayments = TossPayments(clientKey)
		function goPay(){
			tossPayments.requestPayment('카드', {
		          amount: ${price},
		          orderId: ${orderID},
		          orderName: "캠핑 예약",
		          successUrl: "/payment/result?status=success",
		          failUrl: "/payment/result?status=fail"
		        })
		}
	</script>
</head>
<body>
	
</body>
</html>