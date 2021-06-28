<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<%@ page isErrorPage="true" %>    


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/upload.css">
</head>


<body>

	<a href="/dashboard">Dashboard</a>
	
	<form:form action="/processForm" method="POST" modelAttribute="upload">
		<p>
			<form:label path="title">Title</form:label>
			<form:input path="title"/>
			<form:errors path="title"></form:errors>
		</p>	
		
		<p>
			<form:label path="artist">Artist</form:label>
			<form:input path="artist"/>
			<form:errors path="artist"></form:errors>
		</p>	
		
		<p>
			<form:label path="rating">Rating (1-10)</form:label>
			<form:select path="rating">
				<form:option value="1">1</form:option>
				<form:option value="2">2</form:option>
				<form:option value="3">3</form:option>
				<form:option value="4">4</form:option>
				<form:option value="5">5</form:option>
				<form:option value="6">6</form:option>
				<form:option value="7">7</form:option>
				<form:option value="8">8</form:option>
				<form:option value="9">9</form:option>
				<form:option value="10">10</form:option>				
			</form:select>
			<form:errors path="title"></form:errors>
		</p>
		
		<input type="submit" value="Add Song">
			
	</form:form>

</body>
</html>