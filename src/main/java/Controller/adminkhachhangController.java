package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.khachhangbean;

import bo.khachhangbo;


/**
 * Servlet implementation class sachController
 */
@WebServlet("/adminkhachhangController")
public class adminkhachhangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminkhachhangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			if(session.getAttribute("admin")==null) {
				response.sendRedirect("admindangnhapController");
			} else {
			
			
			khachhangbo khbo = new khachhangbo();
			ArrayList<khachhangbean> dskh = khbo.getKhachhang();
			
			//Mang a luu cac gia tri so hang khach hang da dat mua
			//Mang b luu cac gia tri so hang khach hang da thanh toan
			long a[] = new long[100] ; int i=0; 
			long b[] = new long[100] ;
			
			for(khachhangbean kh:dskh) {
				a[i] = khbo.soHangDaDatMua(kh.getMakh()); 
				b[i] = khbo.soHangDaThanhToan(kh.getMakh());
				i++;
			}
				
			request.setAttribute("dskh", dskh);
			request.setAttribute("dadatmua", a);
			request.setAttribute("dathanhtoan", b);

			
			RequestDispatcher rd = request.getRequestDispatcher("adminkh.jsp");
			rd.forward(request, response);
			
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
