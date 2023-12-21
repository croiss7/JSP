<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jsp.system.Ajax, org.json.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style>
	div{
		display:inline-block;
	}
	div.id, div.author{
	width:100px;
	}
	div.title{
	width:600px;
	}
</style>
<script defer src="/resources/boardlist.js"></script>

</head>
<body>
	<div id="boards">
		<template>
			<div class="id">0</span>
			<div class="title">	제목	</span>
			<div class="author">작성자</span>
		</template>
	</div>
</body>
</html>