<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����� ���</title>
</head>
<body>
	<h1>[����� ���]</h1>
	<table border=1>
		<tr>
			<td width=100>���̵�</td>
			<td width=100>��й�ȣ</td>
			<td width=100>����</td>
			<td width=100>����Ʈ</td>
			<td width=100>���� �޼���</td>	
			<td width=100>���� �޼���</td>
		</tr>
	<c:forEach items = "${list }" var ="vo">
		<tr>
			<td width=100>${vo.uid }</td>
			<td width=100>${vo.upw }</td>
			<td width=100>${vo.uname }</td>
			<td width=100>${vo.point }</td>
			<td width=100><button onClick ="location.href='send?uid=${vo.uid}'">���� �޼���</button></td>
			<td width=100><button onClick ="location.href='receive?uid=${vo.uid}'">���� �޼���</button></td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>