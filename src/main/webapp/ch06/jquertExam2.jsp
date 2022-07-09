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
		$("#b2").text($("p").text());
	});
	$("#b2").click(function(){
		$("#display").html("<img src='myFace.png' border='0'/>");
	});
})
</script>
<style>
div#displayArea{
width:200px;
height:200px;
border:5px double #6699FF;
}
</style>
</head>
<body>
<p>이미지표시</p>
<button id="b1">버튼레이블 변경</button>
<div id="display"></div>
<button id="b2">버튼</button>
</body>
</html>