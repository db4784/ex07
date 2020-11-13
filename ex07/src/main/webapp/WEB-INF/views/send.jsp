<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�޼��� ������</title>
</head>
<body>
	<h1>[�޼��� ������]</h1>
	<table border=1>
		<tr>
			<td width=100>�߽���</td>
			<td width=500>${vo.uname }[����Ʈ :<span id ="point">${vo.point }]</span></td>
		</tr>
		<tr>
			<td width=100>������</td>
			<td><select id="receiver">
					<c:forEach items="${list }" var="v">
						<c:if test="${vo.uid != v.uid }">
							<option value="${v.uid }">${v.uname}</option>
						</c:if>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td>����</td>
			<td><input type="text" size=70 id="txtMessage"></td>
		</tr>
	</table>
	<button id="btnSend">������</button>
	<h1>[���� �޽���]</h1>
	<table id ="tbl" border =1></table>
	<script id ="temp" type ="text/x-handlebars-template">
		<tr>
			<td width =100>�߽���</td>
			<td width =300>����</td>
			<td width =200>���� ��¥</td>
			<td width =150>���� Ȯ��</td>
		</tr>
		{{#each .}}
		<tr class ="row">
			<td>{{receiver}}<br>{{uname}}</td>
			<td>{{message}}</td>
			<td>{{sendDate}}</td>
			<td>{{{confirm readDate}}}&nbsp;<a href="{{mid}}">����</a> </td>
		</tr>
		{{/each}}
	</script>
	<script>
		Handlebars.registerHelper("confirm", function(readDate){
			if(!readDate) return "<span style='color:red;'>���� ����</span>";
			else return "<span style='color:blue;'>����</span>";
		});
	</script>
</body>
<script>
	var sender="${vo.uid}";
	
	$("#tbl").on("click", ".row a", function(e){
		e.preventDefault();
		var mid=$(this).attr("href");
		if(!confirm(mid + "��(��) �����Ұǰ���?")) return;
		$.ajax({
			type:"post",
			url:"delete",
			data:{"mid":mid},
			success:function(){
				alert("�޽��� ������");
				getList();
			}
		});
	});
	
	getList();
	function getList(){
		$.ajax({
			type:"get",
			url:"sendList",
			data:{"sender":sender},
			success:function(data){
				var temp=Handlebars.compile($("#temp").html());
				$("#tbl").html(temp(data));
			}
		});
	}
	
	
	$("#btnSend").on("click", function(){
		var receiver =$("#receiver").val();
		var message =$("#txtMessage").val();
		if(message==""){
			alert("�Է���");
			return;
		}
		if(!confirm("�޼��� ������?")) return;
		$.ajax({
			type:"post",
			url:"insert",
			data:{"sender":sender, "receiver":receiver, "message":message},
			success:function(){
				alert("�޼��� ���۵�^^");
				$("#txtMessage").val("");
				getList();
				getUser();
			}
		});
	});
	
	function getUser(){
		$.ajax({
			type:"get",
			url:"read",
			data:{"uid":sender},
			success:function(data){
				$("#point").html(data.point);
			}
		});
	}
</script>
</html>