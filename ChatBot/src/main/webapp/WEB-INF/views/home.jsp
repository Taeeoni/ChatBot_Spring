<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
	color: #666;
	font: 14px/24px "Open Sans", "HelveticaNeue-Light",
		"Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial,
		"Lucida Grande", Sans-Serif;
}

table {
	border-collapse: separate;
	border-spacing: 0;
	width: 800px;
	
}

th, td {
	padding: 6px 15px;
}

th {
	background: #42444e;
	color: #fff;
	text-align: left;
}

tr:first-child th:first-child {
	border-top-left-radius: 6px;
}

tr:first-child th:last-child {
	border-top-right-radius: 6px;
}

td {
	border-right: 1px solid #c6c9cc;
	border-bottom: 1px solid #c6c9cc;
	text-align: left;
}

td:first-child {
	border-left: 1px solid #c6c9cc;
}

tr:nth-child(even) td {
	background: #eaeaed;
}

tr:last-child td:first-child {
	border-bottom-left-radius: 6px;
}

tr:last-child td:last-child {
	border-bottom-right-radius: 6px;
}

.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid #ddd;
}

.pagination a.active {
	background-color: #78b9f7;
	color: white;
	border: 1px solid #78b9f7;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}

div, table {
	text-align: center;
	margin-left: auto;
	margin-right: auto;
}

input[name=add] {
	width: 100px;
	height: 50px;
}



</style>

<body>
 <div>
	<h3>회원등록</h3>
<form method='post' >
	<table>

		<tr>
			<th width=100>아이디</th>
			<th width=400>비밀번호</th>			
		</tr>
		<tr>
			<td><input name='userid' type="text" value='' /></td>
			<td><input name='password' type="text" value=''/></td>
		</tr>

	</table>
	</br>
	<input formaction='/home/userAdd' type='submit' value="회원등록" />
	<input formaction='/home/logIn' type='submit' value="로그인" />
	</form>
</div>
	
</body>
</html>