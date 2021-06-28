<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/artist.css">
</head>


<body>

	<h2>Songs by artist <c:out value="${songs.artist}"/></h2>

	<form action="/search" method="post">
		<input type="search" name="artist">
		<input type="submit" value="New Search">
	</form>
	
	<a href="/dashboard">Dashboard</a>
	
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
				<td> <a href="/songs/<c:out value="${song.id}"/>">${song.title}</a></td>
				<td><c:out value="${song.rating}"></c:out></td>
				<td><form action="/song/delete/${song.id}" method="POST">
				<input type="hidden" name="_method" value="delete">
				<input type="submit" value="delete"></form></td>
			</tr>
			
			</c:forEach>
		</tbody>
	</table>

</body>
</html>