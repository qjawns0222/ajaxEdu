<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>XML JSON로부터 객체 생성</title>
<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript" src="member.js"></script>
<script type="text/javascript">
window.onload = function() {
   new ajax.xhr.Request("member_xmljson.jsp", "", viewInfo, "GET");
}
function viewInfo(req) {
   if(req.readyState == 4) {
      if(req.status == 200) {
         var docXML = req.responseXML;
         var code = docXML.getElementsByTagName("code").item(0).firstChild.nodeValue;
         if(code == 'success') {
            var dataJSON = docXML.getElementsByTagName("data").item(0).firstChild.nodeValue;
            var data = eval("(" + dataJSON + ")");
            alert(data.name +"[" + data.id + "]");
         }else {
            alert("실패");
         }
      }else {
         alert("에러 발생: " + req.status);
      }
   }
}
</script>
</head>
<body>

</body>
</html>