<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �޼���</title>
<style>
	.read{color:blue}
	.unread{color:red}
</style>
</head>
<body>
	<h1>[���� �޼���]</h1>
	<table border=1>
		<tr>
			<td width=100>���� ���</td>
			<td width=100>${vo.uname }</td>
			<td width=100>POINT</td>
			<td width=100><b><span id ="point">${vo.point }</span></b></td>
		</tr>
	</table>
	<br>
	<table border=1 id ="tbl"></table>
	<script id ="temp" type ="text/x-handlebars-template">
		<tr>
			<td width =150>������</td>
			<td width =300>����</td>
			<td width =150>������¥</td>
			<td width =50>�б�</td>
		</tr>
		{{#each .}}
		<tr class = "row">
			<td>{{sender}}-{{uname}}</td>
			<td>{{message}}</td>
			<td>{{sendDate}}</td>
			<td><button class ="{{confirm readDate}}" mid="{{mid}}">�б�</button></td>
		</tr>
		{{/each}}
	</script>
	<script>
		Handlebars.registerHelper("confirm", function(readDate){
			if(!readDate) return "unread";
			else return "read";
		});
	</script>
	<div id="divRead" style ="width:700px; background:darkGray; color:white; margin:10px">
		������ : <span id ="sender"></span><br>
		���� : <span id ="message"></span><br>
		�߽��� : <span id ="sendDate"></span><br>
		������ : <span id ="readDate"></span>
	</div>
</body>
<script>
	var receiver ="${vo.uid}";

	getList();
	$("#divRead").hide();
	$("#tbl").on("click", ".row button", function(){
		var mid=$(this).attr("mid");
		$("#divRead").show();
		$.ajax({
			type:"get",
			url:"readMessage",
			data:{"mid":mid},
			success:function(data){
				$("#sender").html(data.uname);
				$("#message").html(data.message);
				$("#sendDate").html(data.sendDate);
				$("#readDate").html(data.readDate);
				getList();
				getUser();
			}
		});
	});
	
	function getList(){
		$.ajax({
			type:"get",
			url:"receiveList",
			data:{"receiver":receiver},
			success:function(data){
				var temp =Handlebars.compile($("#temp").html());
				$("#tbl").html(temp(data));
			}
		});
	}
	
	function getUser(){
		$.ajax({
			type:"get",
			url:"read",
			data:{"uid":receiver},
			success:function(data){
				$("#point").html(data.point);
			}
		});
	}

</script>
</html>