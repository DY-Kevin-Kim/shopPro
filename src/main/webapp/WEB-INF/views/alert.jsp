<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>alert_Page</title>
</head>
<body>

	<script type="text/javascript">
		var message = "${msg}";
		var url = "${url}";
		alert(message);
		document.location.href = url;
	</script>
</body>
</html>