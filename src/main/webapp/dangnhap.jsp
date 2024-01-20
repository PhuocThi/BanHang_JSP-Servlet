<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Đăng nhập</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="./font/fontawesome-free-6.4.0-web/css/all.css">
  
<style>
	input[type="text"],
	input[type="password"]{
		width: 300px;
	}
	
	.formdn {
		box-sizing : border-box;
		padding : 16px;
		width: 350px;
		height: 350px;
		margin: auto;
		border: 2px solid #333;
		border-radius: 6px;
	}
</style>

</head>

<body>
	<%
		if(request.getParameter("dkythcong")!=null) {
				
	%>
	<script>
		alert("Bạn đã đăng ký tài khoản thành công. Hãy đăng nhập để mua hàng!");
	</script>
	<% } %>
	<div style="height: 100px;">
		
	</div>
	<form action="dangnhapController" method = "post" class="formdn">
		<center><b>ĐĂNG NHẬP</b></center>
  		<div class="mb-3 mt-3">
    		<label for="text" class="form-label">Tên tài khoản:</label>
    		<input type="text" class="form-control" id="email" placeholder="Nhập tên tài khoản" name="tentk">
  		</div>
  		<div class="mb-3">
   			<label for="pwd" class="form-label">Mật khẩu:</label>
    		<input type="password" class="form-control" id="pwd" placeholder="Nhập mật khẩu" name="mk">
  		</div>
  		
  		<button type="submit" class="btn btn-primary">Đăng nhập</button>
  		<%
		if(request.getParameter("tb")!=null) {
			String tb = request.getParameter("tb");
			if(tb!=null && tb.equals("1")){
				out.print("<br><br><b>Bạn đã nhập sai thông tin tài khoản !</b>");
			}
		}	
		%>
	</form>
	
	<div style="display: flex;justify-content: center; margin-top: 16px;">
		<button class="btn btn-primary">
			<a href="hangController" style="color:white;text-decoration: none;">
			Trở về trang chủ</a>
		</button>
	</div>
</body>
</html>