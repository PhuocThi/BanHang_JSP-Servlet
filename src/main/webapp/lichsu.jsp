<%@page import="bean.lichsubean"%>
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

	
	
	.table-1, .tr-1, .td-1 {
		border: 1px solid black;
	}
	
	.table-1{
		width: 800px;
	}
	.td-1{
		width: 15%;
	}

</style>
<body>

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
	                <a href="#" class="nav-item nav-link">Lịch sử mua hàng</a>
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
		
		<div class="row">
			<div class="col-md-2" style="background-color: white;">
				
			</div>
			
			<div class="col-md-10" style="padding-left: 0; padding-right: 0;">
				<div style="font-size: 24px;font-weight: 500;padding-bottom: 30px;margin-left: 250px;">
					<b>LỊCH SỬ MUA HÀNG
					</b>
				</div>
					<%
						if(session.getAttribute("dshd")!=null) {
							ArrayList<String> dshd =(ArrayList<String>) session.getAttribute("dshd");
							
							if(session.getAttribute("lsmua")!=null) {
								ArrayList<lichsubean> lsmua = (ArrayList<lichsubean>)session.getAttribute("lsmua");
								
								for(String hd: dshd) {
					%>
									<b>Mã hóa đơn : <%=hd%></b> <br>
								<% 
									long tongtien = 0;
									for(lichsubean ls:lsmua) {
										if(ls.getMahd()==Long.parseLong(hd)) {
											
											tongtien += ls.getThanhtien();
											
								%>
											<table class="table-1">
												
												<tr class="tr-1">
													<td class="td-1"><%=ls.getTenhang() %></td>
													<td class="td-1"><%=ls.getSoluongmua() %></td>
													<td class="td-1"><%=ls.getGia() %></td>
													<td class="td-1"><%=ls.getThanhtien() %></td>
													<td class="td-1"><%=ls.getNgaymua() %></td>
													<td class="td-1"><%=(ls.isDamua()==false)?"chưa xác nhận":"đã xác nhận" %></td>
													
												</tr>
											
											</table>
								<% 			
										}
									}
									out.print("<b>Tổng tiền : </b><b>"+tongtien+" đ</b><br><br>");
								}
							}
							
							
						}
					%>
			
			</div>
			
			</div>
		</div>
		
	

	
	
</body>
</html>