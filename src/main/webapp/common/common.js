/**

 */
//공백인지 아닌지 체크하는 메소드
	function checkEmpty(obj,msg){
		if(obj.value==""){
			alert(msg);
			obj.focus();
			return true;
		} else {
			return false;
		}
	}
