<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/topten.css">
</head>


<body>

	<h1>Top Ten Songs:</h1>
	<a href="/dashboard">Dashboard</a>
		
	<ul>
	<c:forEach items="${Songs}" var="song">
		<li>
		<c:out value="${song.rating}"/> - <a href="songs/${song.id}">${song.title}</a> - <c:out value="${song.artist}"/>
		</li>
	</c:forEach>	
	</ul>
	
</body>
</html>