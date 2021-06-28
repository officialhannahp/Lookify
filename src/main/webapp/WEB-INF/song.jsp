<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/song.css">
</head>


<body>

	<a href="/dashboard">Dashboard</a>


	<h3>Title:   <c:out value="${song.title}"></c:out></h3>
	<h3>Artist:   <c:out value="${song.artist}"></c:out></h3>
	<h3>Rating (1-10)   <c:out value="${song.rating}"></c:out></h3>

<form action="/songs/delete/${song.id}" method="POST">
				<input type="hidden" name="_method" value="delete">
				<input type="submit" value="delete"></form>

	

</body>
</html>