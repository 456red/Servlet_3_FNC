<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="../css/header.css" rel="stylesheet">
<style type="text/css">
	
	h1 {
		width: 30%;
		margin: 0 auto;
		text-align: center;
	}
	
</style>
</head>
<body>
	<%@ include file="../temp/header.jsp" %>
	<section id="main">

		<h1>Member Join Form Add GitHUb add Local</h1>
		<form name="frm" class="form-horizontal" action="memberUpdateProcess.jsp" method="post">
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="pw">PW:</label>
				<div class="col-sm-10">
					<input type="password" value="<%=memberDTO.getPw() %>" class="form-control ch" id="pw" name="pw"
						placeholder="Enter Pw">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pw">PW:</label>
				<div class="col-sm-10">
					<input type="password" value="<%=memberDTO.getPw() %>" class="form-control ch" id="pw2"
						placeholder="Enter Pw">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="Name">Name:</label>
				<div class="col-sm-10">
					<input type="text" value="<%=memberDTO.getName() %>" required="required" class="form-control ch" id="name" name="name"
						placeholder="Enter Name">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="Email">Email:</label>
				<div class="col-sm-10">
					<input type="text" value="<%= memberDTO.getEmail() %>" class="form-control ch" id="email" name="email"
						placeholder="Enter Email">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="Phone">Phone:</label>
				<div class="col-sm-10">
					<input type="text" value="<%= memberDTO.getPhone() %>" class="form-control ch" id="phone" name="phone"
						placeholder="Enter Phone">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="Age">Age:</label>
				<div class="col-sm-10">
					<input type="text" value="<%= memberDTO.getAge() %>" class="form-control ch" id="age" name="age"
						placeholder="Enter Age">
				</div>
			</div>
			
			
			
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" id="check" value="UPDATE">
				</div>
			</div>
		</form>
		
	</section>
	
	<%@ include file="../temp/footer.jsp" %>

	


</body>
</html>