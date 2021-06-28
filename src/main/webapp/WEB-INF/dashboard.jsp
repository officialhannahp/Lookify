<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/dashboard.css">
</head>


<body>
	<a href="/songs/new/">Add New</a>
	<a href="/search/topten/">Top Songs</a>
	
	<form action="/search" method="post">
      <input type="search" placeholder="Search.." name="search">
	  <input type="submit" value="New Search">
    </form>
	
	<table>
		<thead>
			<tr>
				<th>Name</th>
				<th>Rating</th>
				<th>actions</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${Songs}" var="song">
			<tr>
				<td> <a href="/songs/${song.id}">${song.title}</a></td>
				<td><c:out value="${song.rating}"></c:out></td>
				<td><form action="/songs/delete/${song.id}" method="POST">
				<input type="hidden" name="_method" value="delete">
				<input type="submit" value="delete"></form></td>
			</tr>
			
			</c:forEach>
		</tbody>
	</table>
</body>
</html>