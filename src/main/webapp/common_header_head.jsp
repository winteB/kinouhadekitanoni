<%@ page pageEncoding="UTF-8"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>niwacan - Lifestyle & Garden (Integrated)</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/css.css"/>
	<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
	<script type="text/javascript" src="common/common.js"></script>
	
<script type="text/javascript">
	function goPage(servlet,gubun){
		work.t_gubun.value=gubun;
		work.method="post";
		work.action=servlet;
		work.submit();
	}
</script>
