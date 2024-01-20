<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Đăng ký</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="./font/fontawesome-free-6.4.0-web/css/all.css">
  
<style>
	input[type="text"],
	input[type="password"],
	input[type="email"]{
		width: 300px;
		margin: 4px 0;
	}
	
	.formdk {
		box-sizing : border-box;
		padding : 16px;
		width: 350px;
		height: 580px;
		margin: auto;
		border: 2px solid #333;
		border-radius: 6px;
	}
</style>

</head>

<body>
	
	<div style="height: 70px;">
		
	</div>
	<form action="dangkyController" method = "post" class="formdk">
		<center><b>ĐĂNG KÝ</b></center>
  		
    	Họ tên : <input type="text" class="form-control" id="name" placeholder="Nhập họ tên" name="tenkh">
  		Tên tài khoản : <input type="text" class="form-control" id="user" placeholder="Nhập tên tài khoản" name="tentk">
  		Mật khẩu : <input type="password" class="form-control" id="pass" placeholder="Nhập mật khẩu" name="mk">
  		Địa chỉ : <input type="text" class="form-control" id="address" placeholder="Nhập địa chỉ" name="diachi">
  		Số điện thoại : <input type="text" class="form-control" id="sdt" placeholder="Nhập số điện thoại" name="sdt">
  		Email : <input type="email" class="form-control" id="email" placeholder="Nhập email" name="email">
  	
   
  		<button type="submit" class="btn btn-primary" style="margin-top: 16px;">Đăng ký</button><br>
  		<%
			String tb1 = request.getParameter("tb1");
			if(tb1!=null) {
				out.print("<b>Tên tài khoản đã tồn tại !</b>");
			}
			
			String tb2 = request.getParameter("tb2");
			if(tb2!=null) {
				out.print("<b>Bắt buộc phải nhập họ tên, tên tài khoản, mật khẩu và số điện thoại !</b>");
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