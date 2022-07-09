<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#b1").click(function(){
	$.post("process.jsp",{name:"kingdara",stus:"homebody"},function(data,status){
		if(status=="success")$("#result").html(data);
	});
	});
})
</script>
<style>
#result{
width:200px;
height:250px;
border:5px double #6699FF;

word-break:break-all;
}
</style>
</head>
<body>
<button id="b1">결과</button>
<div id="result"></div>

</body>
</html>