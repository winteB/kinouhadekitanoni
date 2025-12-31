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
		          amount: 15000,
		          orderId: 'zUo_E9x6JfRS46bqXbvLh',
		          orderName: '토스 티셔츠 외 2건',
		          customerName: '박토스',
		          successUrl: 'Paymant',
		          failUrl: 'Paymant',
		        })
		}
	</script>
</head>
<body>
	
</body>
</html>