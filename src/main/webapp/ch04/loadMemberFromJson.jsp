<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript">
window.onload=function(){
	new ajax.xhr.Request("member_json.jsp","",viewInfo,"GET");
}
function viewInfo(req){

	if(req.readyState==4){
		if(req.status==200){
			var result=eval("("+req.responseText+")");
			if(result.code=='success'){
				var m=result.data.member;
				alert(m.id+"["+m.name+"]");
			}else{
				alert("실패");
			}
			
		}else{
			alert("에러발생:"+req.status);
		}
		
	}
}

</script>
</head>
<body>

</body>
</html>