<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>사용자 목록</title>
</head>
<body>
	<h1>[사용자 목록]</h1>
	<table border=1>
		<tr>
			<td width=100>아이디</td>
			<td width=100>비밀번호</td>
			<td width=100>성명</td>
			<td width=100>포인트</td>
			<td width=100>보낸 메세지</td>	
			<td width=100>받은 메세지</td>
		</tr>
	<c:forEach items = "${list }" var ="vo">
		<tr>
			<td width=100>${vo.uid }</td>
			<td width=100>${vo.upw }</td>
			<td width=100>${vo.uname }</td>
			<td width=100>${vo.point }</td>
			<td width=100><button onClick ="location.href='send?uid=${vo.uid}'">보낸 메세지</button></td>
			<td width=100><button onClick ="location.href='receive?uid=${vo.uid}'">받은 메세지</button></td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>