<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Admin</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="./font/fontawesome-free-6.4.0-web/css/all.css">
  
  <style>
	input[type="password"]{
		width: 300px;
	}
	
	input[type="submit"] {
		margin : 30px 0 0 100px;
	}
	
	.formdn {
		margin-top : 200px;
		box-sizing : border-box;
		padding : 16px;
		width: 350px;
		height: 250px;
		margin: auto;
		border: 2px solid #333;
		border-radius: 6px;
	}
</style>
</head>
<body>
	<div class="formdn">
		<form action="admindangnhapController" method="post">
			<center><b>ADMIN</b></center> <br>
			Mật khẩu : <input type="password" name="adminmk" placeholder="Nhập mật khẩu"> <br>
			<input type="submit" value="Đăng nhập" class="btn btn-primary">
		</form>
		<br>
		
		<%
			if(request.getParameter("tb")!=null) {
				String tb = request.getParameter("tb");
				if(tb!=null){
					out.print("<b>"+tb+"</b>");
				}
			}	
		%>
	</div> 
</body>
</html>