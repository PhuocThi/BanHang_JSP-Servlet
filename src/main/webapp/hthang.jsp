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
<title>Bán hàng</title>
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
	.content {
		padding-top: 100px;
	}

	.product-image {
		width: 240px;
		height: 260px;
	}
	
	.footer .row{
		position: relative;
   		bottom: -50px;
		justify-content: space-evenly;
		padding-top:10px;
		color: white;
		background: #333;
	}
	
	.col-sm-4 p {
		margin-bottom: 4px;
	}
	
	.footer .row .col-sm-4 {
		padding : 16px 0 16px 12px;
	}
	.col-sm-4 i {
		font-size: 30px;
		margin: 12px 12px 0 0;
		cursor: pointer;
	}
	
	.allsp {
		padding: 6px 110px 6px 32px;
    	margin: 12px 0 16px;
	}
	
	.allsp a {
		color:white;
		text-decoration: none;
	}

</style>
<body>

<script type="text/javascript">
	function datmuatcong() {
		alert("Bạn đã đặt mua thành công !");
	}
</script>

<%
if(session.getAttribute("dem")==null) {	
	long dem=0;
	session.setAttribute("dem", dem);
}

long dem=0;
if(session.getAttribute("dem")!=null)
	{dem = (long) session.getAttribute("dem");}


%>


    <nav class="navbar navbar-expand-sm bg-dark navbar-dark header">
	    <div class="container-fluid">
	        <a href="hangController" class="navbar-brand">Trang chủ</a>
	        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
	            <span class="navbar-toggler-icon"></span>
	        </button>
	        <div class="collapse navbar-collapse" id="navbarCollapse">
	            <div class="navbar-nav">
	                <a href="gioController" class="nav-item nav-link">Giỏ hàng
	                	<%if(dem>0){ %><span class="slmua"><%=dem%></span><%}%>
	                </a>
	                <a href="lichsuController" class="nav-item nav-link">Lịch sử mua hàng</a>
	            </div>
	            <div class="navbar-nav ms-auto">
	                <a href="dangkyController" class="nav-item nav-link">Đăng ký</a>
	                <%
                	khachhangbean kh = (khachhangbean)session.getAttribute("dn");
      				if(kh==null) {
      			%>
     			 <a href="dangnhapController" class="nav-item nav-link">
     			 	 Đăng nhập</a>
     			 	 
      			<% } else {%>
      
			      <p style="color:white; padding-top:8px;margin:0 8px;">Xin chào <%=kh.getTenkh()%> <p>
			      <a href="dangxuatController" class="nav-item nav-link">Đăng xuất</a>
			      
      			<% } %>
	            </div>
	        </div>
	    </div>
	</nav>
	

	
	<div class="container-fluid content">
		<div class="row" style="padding-bottom: 70px;">
			<div class="col-md-1" style="background-color: white;">
			</div>
			<div class="col-md-6"><b>Tìm kiếm sản phẩm</b>
				<form action="hangController">
					<input type="text" placeholder="Nhập tìm kiếm" name="txttim" 
						   class="form-control" style="margin:10px 0px;"> 
					<input type="submit" value="Search" class="btn-primary" name="th">
				</form>
			</div>
			
		</div>
		<div class="row">
			<div class="col-md-3" style="padding-left: 32px;">
				<div style="height: 60px; padding-left: 28px;">
					<b style="font-size: 25px;font-weight: 700;">
							PHÂN LOẠI
					</b>
				</div>
				<div class="dropdown">
 					<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown"
 					style="width: 260px;">
   					 Phân loại theo nhà sản xuất
  					</button>
  					<ul class="dropdown-menu">
			<%
				//loaibo lbo = new loaibo();
				//lay dsloai tu sachController gui ve
				
			
				ArrayList<loaibean> dsloai;
				if(session.getAttribute("dsloai")!=null) {
					dsloai = (ArrayList<loaibean>)session.getAttribute("dsloai");
				for(loaibean loai : dsloai) {
								
			%>
					<li>
						<a class="dropdown-item" href="hangController?ml=<%=loai.getMaloai()%>">
						<%= loai.getTenloai() %>
						</a>
					</li>
					<% } } %>
				
				</ul>
				</div>
				
				<div class="dropdown" style="margin: 30px 0 20px;">
 					<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown"
 					style="width: 260px;">
   					 Phân loại theo chất liệu
  					</button>
  					<ul class="dropdown-menu">
			<%

				ArrayList<String> dschatlieu;
				if(session.getAttribute("dschatlieu")!=null) {
					dschatlieu = (ArrayList<String>)session.getAttribute("dschatlieu");
				for(String h : dschatlieu) {
								
			%>
					<li>
						<a class="dropdown-item" href="hangController?chatlieu=<%=h.trim().toLowerCase()%>"><%=h%>
						</a>
					</li>
					<% } } %>
				</ul>
				</div>
				
				<button type="button" class="btn btn-primary allsp">
					<a href="hangController">
					Tất cả sản phẩm</a>
				</button>
				
			</div>
	
			<div class="col-md-8" style="margin-left: 12px;">
				<center style="height: 60px;">
					<b style="font-size: 25px;font-weight: 700;">
							DANH SÁCH SẢN PHẨM
					</b>
				</center>
				<div class="container-fluid">
					
				<%

					
				
					ArrayList<hangbean> ds;
					if(request.getAttribute("dshang")!=null) {
						ds = (ArrayList<hangbean>)request.getAttribute("dshang");
					
					int n=ds.size();
					for(int i=0;i<n;i++)
					{
						hangbean h = ds.get(i); 
									
					%>
					
					  <div class="row">
						<div class="col-lg-4">
							<img class="product-image" src="<%=h.getAnh()%>"> <br> 
							Tên hàng: <%=h.getTenhang() %> <br> 
							Chất liệu: <%=h.getChatlieu() %> <br>
							Giá: <b style="font-weight: 700;font-size: 20px;color: red;"><%=h.getGia() %> đ
							</b> <br>
							<a href="gioController?mh=<%=h.getMahang()%>
											&th=<%=h.getTenhang()%>
											&gia=<%=h.getGia()%>
									 "		onclick="datmuatcong()"						
							 >
								<img src="buynow.jpg" style="width: 120px;margin-top: 10px;">
							 </a>
							 <br><br><br><br>
						</div>
						<%i++;
						  if(i<n) 
						  	{ h=ds.get(i);	
						
						%>
						<div class="col-lg-4">
							<img class="product-image" src="<%=h.getAnh()%>"> <br> 
							Tên hàng: <%=h.getTenhang() %> <br> 
							Chất liệu: <%=h.getChatlieu() %> <br>
							Giá: <b style="font-weight: 700;font-size: 20px;color: red;"><%=h.getGia() %> đ
							</b><br>
							<a href="gioController?mh=<%=h.getMahang()%>
											&th=<%=h.getTenhang()%>
											&gia=<%=h.getGia()%>
									 "		onclick="datmuatcong()"							
							 >
								<img src="buynow.jpg" style="width: 120px;margin-top: 10px;">
							 </a>
							 <br><br><br><br>
						</div>
					
						
					<% 	} %>
					
					<%i++;
						  if(i<n) 
						  	{ h=ds.get(i);	
						
						%>
						<div class="col-lg-4">
							<img class="product-image" src="<%=h.getAnh()%>"> <br> 
							Tên hàng: <%=h.getTenhang() %> <br> 
							Chất liệu: <%=h.getChatlieu() %> <br>
							Giá: <b style="font-weight: 700;font-size: 20px;color: red;"><%=h.getGia() %> đ
							</b><br>
							<a href="gioController?mh=<%=h.getMahang()%>
											&th=<%=h.getTenhang()%>
											&gia=<%=h.getGia()%>
									 "	onclick="datmuatcong()"								
							 >
								<img src="buynow.jpg" style="width: 120px;margin-top: 10px;">
							 </a>
							 <br><br><br><br>
						</div>
					
						
					<% 	} %>
					
					
					
					</div>
					
				<% } } %>
					
				</div>
			</div>
			
			</div>
		</div>
		
	<div class="footer">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-4" style="font-size: 12px;">
					<p>CÔNG TY TNHH TRUYỀN THÔNG SỐ</p>
	 				<p>Giấy CNĐKKD: 0304710474, Ngày cấp: 22/11/2006</p>
	 				<p>Văn phòng: 427 Trường Chinh, F.14, Q.Tân Bình, Tp.HCM</p>
	 				<p>Địa chỉ làm việc: 309 Vườn Lài, P.Phú Thọ Hòa, Q.Tân Phú, Tp.HCM</p>
					<p> Điện thoại: 0938.82.02.02 - 0906.644.645</p>
	 				<p>Email: 2banh@igo.vn</p>
				</div>
		
				<div class="col-sm-4">
					<b>CỘNG ĐỒNG</b> <br>
					<i class="fa-brands fa-facebook"></i> 
					<i class="fa-brands fa-tiktok"></i> 
					<i class="fa-brands fa-instagram"></i> 
					<i class="fa-solid fa-envelope"></i> 
				</div>
			</div>
		</div>
	
	</div>

	
	
</body>
</html>