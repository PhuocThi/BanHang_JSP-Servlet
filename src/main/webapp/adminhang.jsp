
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
<title>Quản lý hàng</title>
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
	
	img {
		width: 100px;
		height: 100px;
	}
	
	label {
		margin-left:16px;
		width: 80px;
		
	}
	
	input,select {
		width: 200px;
	}
	
	.btn-add {
		margin: 12px;
		width: 70px;
		height: 40px;
	}
	
	

</style>
<body>



	<nav class="navbar navbar-expand-sm bg-dark navbar-dark header">
	    <div class="container-fluid">
	        <a href="adminloaiController" class="navbar-brand">Quản lý hàng</a>
	        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
	            <span class="navbar-toggler-icon"></span>
	        </button>
	        <div class="collapse navbar-collapse" id="navbarCollapse">
	            <div class="navbar-nav">

     			 <a href="adminloaiController" class="nav-item nav-link">
     			 	 Quản lý loại</a>
     			 	 
			      <a href="adminxacnhanController" class="nav-item nav-link">Xác nhân đơn hàng</a>
			      
      			<a href="adminkhachhangController" class="nav-item nav-link">Danh sách khách hàng</a>
	            </div>
	            <div class="navbar-nav ms-auto">
	                <a href="adminthoatController" class="nav-item nav-link">Thoát</a>
	       		</div>
	        
	    </div>
	</nav>
	
	<div class="container-fluid">
	<div class="row">
	<div class="col-md-4">
	<form action="adminhangController" method="post" class="form-1">
		<label>Mã hàng: </label><input type="text" name="txtmahang" value=""> <br>
		<label>Tên hàng : </label><input type="text" name="txttenhang" value=""> <br>
		<label>Số lượng : </label><input type="number" name="txtsoluong" value=""> <br>
		<label>Giá : </label><input type="number" name="txtgia" value=""> <br>
		<label>Ảnh : </label>
			  <select id="image" name="image-hang-them">
				  <option value="image-hang-them/c1.jpg">image-hang-them/c1.jpg</option>
				  <option value="image-hang-them/c2.jpg">image-hang-them/c2.jpg</option>
				  <option value="image-hang-them/c3.jpg">image-hang-them/c3.jpg</option>
				  <option value="image-hang-them/c4.jpg">image-hang-them/c4.jpg</option>
				  <option value="image-hang-them/c5.jpg">image-hang-them/c5.jpg</option>
				  <option value="image-hang-them/y1.jpg">image-hang-them/y1.jpg</option>
				  <option value="image-hang-them/y2.jpg">image-hang-them/y2.jpg</option>
				  <option value="image-hang-them/y3.jpg">image-hang-them/y3.jpg</option>
			  </select> <br>
		<label>Chất liệu :</label>
				<select id="chatlieu" name="txtchatlieu">
				  <option value="gockhoang">Gốc khoáng</option>
				  <option value="bantonghop">Bán tổng hợp</option>
				  <option value="tonghop">Tổng hợp</option>
				  
			    </select> <br>
		<label>Loại :</label>
				<select id="maloai" name="maloai">
				<%
					if(request.getAttribute("dsloai")!=null) {
					ArrayList<loaibean> dsloai = (ArrayList<loaibean>)request.getAttribute("dsloai");
					for(loaibean loai: dsloai) {
				%>
				  <option value="<%=loai.getMaloai() %>" for="maloai"><%=loai.getTenloai() %></option>
				  
				  <% } }%>
			    </select> <br>
		
		<input type="submit" name="butadd" value="Add" class="btn-primary btn-add"> 
		<%
			if(request.getParameter("tb")!=null) {
				String tb = request.getParameter("tb");
				if(tb.equals("1")){
					out.print("<br><b>Mã hàng bị trùng, vui lòng nhập lại mã hàng khác! </b>");
				}
			}
		%>
	</form>
	
	</div>
	
	<div class="col-md-2">
		
	</div>
	
		<div class="col-md-4" style="padding-top:100px;"><b>Tìm kiếm hàng</b>
				<form action="adminhangController">
					<input type="text" placeholder="Nhập tìm kiếm" name="txttim" 
						   class="form-control" style="margin:10px 0px;"> 
					<input type="submit" value="Search" class="btn-primary" name="th">
				</form>
				
				<button class="btn btn-primary" style="margin-top: 16px;width: 200px;">
					<a href="adminhangController" style="color:white;height: 40px;text-decoration: none;
						display: block;line-height: 40px;">
					Tất cả hàng</a>
				</button>
		</div>
	</div>
	</div>
	
    <center style="padding-top:100px;"><b style="font-size: 20px;">DANH SÁCH HÀNG</b> </center>
    <br>
	<table class="table table-hover">
				
		<% 
		if(request.getAttribute("ds")!=null) {
		ArrayList<hangbean> ds = (ArrayList<hangbean>)request.getAttribute("ds");
		for(hangbean h: ds) {
		%>
			<tr><td> <%=h.getMahang()%> </td>
				<td> <%=h.getTenhang() %> </td>
				<td> <%=h.getSoluongton() %> </td>
				<td> <%=h.getGia() %> đ </td>
				<td> <img src="<%=h.getAnh() %>"> </td>
				<td> <%=h.getChatlieu() %> </td>
				<td> <%=h.getMaloai() %> </td>
				
<%-- 				<td><a href="adminloaiController?ml=<%=loai.getMaloai()%>&tab=select"> --%>
<!-- 				Select</a></td> -->
				<td><a href="adminhangController?mh=<%=h.getMahang()%>&tab=delete">
				Delete</a></td>
			</tr>
		<% } } %>
	</table>
</body>
</html>