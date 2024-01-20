
<%@page import="bean.adminxacnhanbean"%>
<%@page import="bean.khachhangbean"%>
<%@page import="bean.hangbean"%>
<%@page import="java.util.ArrayList"%>

<%@page import="bean.khachhangbean"%>
<%@page import="bo.khachhangbo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>DS Khách hàng</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="./font/fontawesome-free-6.4.0-web/css/all.css">

</head>

<style>

	.header {
		position: fixed;
		width: 100%;
		z-index: 99;
	}
	
	.content-container {
		padding-top: 100px;
	}
	
	
	b {
		color: blue;
	}
	
	.form-1 {
		padding-top : 100px;
	}
	
	.table {
		margin:auto;
		width: 1200px;
	}
	
	td {
	    vertical-align: middle;
	    text-align: center;
	}
	
	
</style>
<body>



	<nav class="navbar navbar-expand-sm bg-dark navbar-dark header">
	    <div class="container-fluid">
	        <a href="adminkhachhangController" class="navbar-brand">Danh sách khách hàng</a>
	        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
	            <span class="navbar-toggler-icon"></span>
	        </button>
	        <div class="collapse navbar-collapse" id="navbarCollapse">
	            <div class="navbar-nav">
	             <a href="adminhangController" class="nav-item nav-link">
     			 	 Quản lý hàng</a>

     			 <a href="adminloaiController" class="nav-item nav-link">
     			 	 Quản lý loại</a>
     			 	 
			      <a href="adminxacnhanController" class="nav-item nav-link">Xác nhân đơn hàng</a>
			      
      			
	            </div>
	            <div class="navbar-nav ms-auto">
	                <a href="adminthoatController" class="nav-item nav-link">Thoát</a>
	       		</div>
	        </div>
	    </div>
	</nav>

	
    <center style="padding-top:100px;"><b style="font-size: 20px;">DANH SÁCH KHÁCH HÀNG</b> </center>
    <br>
	<table class="table table-hover">
		<tr>
			<td><b>Mã khách hàng</b></td>
			<td><b>Tên khách hàng</b></td>
			<td><b>Địa chỉ</b></td>
			<td><b>Email</b></td>
			<td><b>Số điện thoại</b></td>
			<td><b>Số hàng đã đặt</b></td>
			<td><b>Số hàng đã thanh toán</b></td>
		</tr>
		
		<% 
			long dadatmua[] = new long[100];
			if(request.getAttribute("dadatmua")!=null) {
				dadatmua = (long[])request.getAttribute("dadatmua"); 
			}
			
			long dathanhtoan[] = new long[100];
			if(request.getAttribute("dathanhtoan")!=null) {
				dathanhtoan = (long[])request.getAttribute("dathanhtoan"); }
		%>
				
		<% 
		if(request.getAttribute("dskh")!=null) {
		ArrayList<khachhangbean> dskh = (ArrayList<khachhangbean>)request.getAttribute("dskh");
		int i=0;
		for(khachhangbean kh: dskh) {
		%>
			<tr><td> <%=kh.getMakh()%> </td>
				<td> <%=kh.getTenkh() %> </td>
				<td> <%=kh.getDiachi() %> </td>
				<td> <%=kh.getEmail() %> đ </td>
				<td> <%=kh.getSdt() %> </td>
				<td> <%=dadatmua[i] %> </td>
				<td> <%=dathanhtoan[i] %> </td>
				
			</tr>
		<% i++; } } %>
	</table>
</body>
</html>