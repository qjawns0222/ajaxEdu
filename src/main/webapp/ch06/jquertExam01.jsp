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
	$("button").click(function(){
		$("#displayArea").html("<img src='ansi_main2s.png' border='0'/>")
	})
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
<div id="displayArea"></div>
<button>하이</button>
</body>
</html>