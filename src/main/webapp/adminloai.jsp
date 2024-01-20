
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
<title>Quản lý loại</title>
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

</style>
<body>

<%
	String maloai = (String)request.getAttribute("maloai");
	String tenloai = (String)request.getAttribute("tenloai");
	String nhacungcap = (String)request.getAttribute("nhacungcap");
	
%>

	<nav class="navbar navbar-expand-sm bg-dark navbar-dark header">
	    <div class="container-fluid">
	        <a href="adminloaiController" class="navbar-brand">Quản lý loại</a>
	        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
	            <span class="navbar-toggler-icon"></span>
	        </button>
	        <div class="collapse navbar-collapse" id="navbarCollapse">
	            <div class="navbar-nav">

     			 <a href="adminhangController" class="nav-item nav-link">
    			 	 Quản lý hàng</a>
     			 	 
			      <a href="adminxacnhanController" class="nav-item nav-link">Xác nhận đơn hàng</a>
			      <a href="adminkhachhangController" class="nav-item nav-link">Danh sách khách hàng</a>
      			
	            </div>
	            <div class="navbar-nav ms-auto">
	                <a href="adminthoatController" class="nav-item nav-link">Thoát</a>
	       		</div>
	        </div>
	    </div>
	</nav>
	
	<form action="adminloaiController" method="post" class="form-1">
		Mã loại : <input type="text" name="txtmaloai" value="<%=(maloai==null)?"":maloai%>"> <br>
		Tên loại : <input type="text" name="txttenloai" value="<%=(tenloai==null)?"":tenloai%>"> <br>
		Nhà cung cấp : <input type="text" name="txtnhacungcap" value="<%=(nhacungcap==null)?"":nhacungcap%>"> <br>
		<input type="submit" name="butadd" value="Add" class="btn-primary"> 
		<input type="submit" name="butupdate" value="Update" class="btn-primary"> <br>
	</form>
	
    <center style="padding-top:100px;"><b style="font-size: 20px;">QUẢN LÝ LOẠI</b> </center>
    <br>
	<table class="table table-hover">
		<tr>
			<td><b>Mã loại</b></td>
			<td><b>Tên loại</b></td>
			<td><b>Nhà cung cấp</b></td>
			<td><b>Chọn</b></td>
			<td><b>Xóa</b></td>
		</tr>
		<% 
		
		ArrayList<loaibean> ds = (ArrayList<loaibean>)request.getAttribute("ds");
		for(loaibean loai: ds) {
		%>
			<tr><td> <%=loai.getMaloai() %> </td>
				<td> <%=loai.getTenloai() %> </td>
				<td> <%=loai.getNhacungcap() %> </td>
				<td><a href="adminloaiController?ml=<%=loai.getMaloai()%>&tab=select">
				Select</a></td>
				<td><a href="adminloaiController?ml=<%=loai.getMaloai()%>&tab=delete">
				Delete</a></td>
			</tr>
		<% } %>
	</table>
</body>
</html>