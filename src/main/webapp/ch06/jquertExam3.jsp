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
	$("p").mouseenter(function(){
		$(this).text("왔구려 마우스포인트!!");
	});
	$("p").mouseleave(function(){
		$(this).text("돌아와 마우스포인트!!");
	});
	$("button").dblclick(function(){
		$(this).css("background-color","#cccccc");
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
<p>마우스 포인터를 여기에</p>
<button>여기 더블클릭</button>

</body>
</html>