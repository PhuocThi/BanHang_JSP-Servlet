
<%@page import="bean.adminxacnhanbean"%>
<%@page import="bean.khachhangbean"%>
<%@page import="bean.hangbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.hangbo"%>
<%@page import="bean.loaibean"%>
<%@page import="bo.loaibo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Xác nhận đơn hàng</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="./font/fontawesome-free-6.4.0-web/css/all.css">

</head>

<style>
	.slmua {
		color: #fff;
		font-weight: 600;
		padding : 2px 6px;
		background-color: tomato;
		border-radius: 50%;
	}
	
	.header {
		position: fixed;
		width: 100%;
		z-index: 99;
	}
	
	.content-container {
		padding-top: 100px;
	}
	
	.product-image {
		width: 240px;
		height: 260px;
	}
	
	b {
		color: blue;
	}
	

</style>
<body>


	<nav class="navbar navbar-expand-sm bg-dark navbar-dark header">
	    <div class="container-fluid">
	        <a href="adminxacnhanController" class="navbar-brand">Xác nhận đơn hàng</a>
	        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
	            <span class="navbar-toggler-icon"></span>
	        </button>
	        <div class="collapse navbar-collapse" id="navbarCollapse">
	            <div class="navbar-nav">

     			 <a href="adminloaiController" class="nav-item nav-link">
     			 	 Quản lý loại</a>
     			 	 
			      <a href="adminhangController" class="nav-item nav-link">Quản lý hàng</a>
			       <a href="adminkhachhangController" class="nav-item nav-link">Danh sách khách hàng</a>
      			
	            </div>
	            <div class="navbar-nav ms-auto">
	                <a href="adminthoatController" class="nav-item nav-link">Thoát</a>
	       		</div>
	        </div>
	    </div>
	</nav>
	
    <center style="padding-top:100px;"><b style="font-size: 20px;">XÁC NHẬN HÓA ĐƠN</b> </center>
    <br>
	<table class="table table-hover">	
		<tr>
			<td><b>Tên khách hàng</b></td>
			<td><b>Tên hàng</b></td>
			<td><b>Số lượng</b></td>
			<td><b>Giá</b></td>
			<td><b>Thành tiền</b></td>
			<td><b>Ngày mua</b></td>
			<td><b>Thuộc hóa đơn</b></td>
			<td><b>Xác nhận</b></td>
		</tr>

			 <%ArrayList<adminxacnhanbean> ds =(ArrayList<adminxacnhanbean> ) request.getAttribute("ds");
			for(adminxacnhanbean xn: ds){
			%>
				<tr>
					<td><%=xn.getTenkh()%></td>
					<td><%=xn.getTenhang() %></td>
					<td><%=xn.getSoluongmua() %></td>
					<td><%=xn.getGia() %></td>
					<td><%=xn.getThanhtien() %></td>
					<td><%=xn.getNgaymua() %></td>
					<td><%=xn.getMahd() %></td>
					<td><a href="adminxacnhanController?mact=<%=xn.getMachitiethd()%>">Xác Nhận</a></td>
				</tr>
			
			<%} %> 

	</table>

</body>
</html>