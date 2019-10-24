<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="form">
WellCome!!
Are you new to the restaurant????

</form>
</body>


<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	//변수선언
	var obj =$("#form");
	
	time();
	//time 설정.
	function time(){
		setTimeout(function() {
			window.location.href = "/"
		}, 1000);
	};
});

</script>

</html>