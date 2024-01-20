package Controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.loaibean;
import bean.hangbean;
import bo.loaibo;
import bo.hangbo;

/**
 * Servlet implementation class adminsachController
 */
@WebServlet("/adminhangController")
public class adminhangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminhangController() {
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
			
			String key = request.getParameter("txttim");
			loaibo lbo = new loaibo();
			ArrayList<loaibean> dsloai = lbo.getloai();
			
					
			long soluong = 0;
			long gia = 0;
					
			String mahang = request.getParameter("txtmahang");
			String tenhang = request.getParameter("txttenhang");	
			
			if(request.getParameter("txtsoluong")!=null) {
				soluong = Long.parseLong(request.getParameter("txtsoluong"));	
			}
			
			if(request.getParameter("txtgia")!=null) {
				gia = Long.parseLong(request.getParameter("txtgia"));	
			}
			String anh = request.getParameter("image-hang-them");
			String chatlieu = request.getParameter("txtchatlieu");
			String maloai = request.getParameter("maloai");
				
	
			hangbo hbo = new hangbo();
			ArrayList<hangbean> ds = hbo.gethang();
			//Neu nguoi dung chon nut Add
			if(request.getParameter("butadd")!=null) {
				if(hbo.ktthemhang(mahang)==true)
					hbo.Them(mahang, tenhang, soluong, gia, anh, chatlieu, maloai);
					else {
						request.setAttribute("ds", ds);
						request.setAttribute("dsloai", dsloai);
						RequestDispatcher rd = request.getRequestDispatcher("adminhang.jsp?tb=1");
						rd.forward(request, response);
					}
				}	
				else {
					String tab = request.getParameter("tab");
					String mh = request.getParameter("mh");
					if(tab!=null) {
						if(tab.equals("delete")) {
							hbo.Xoa(mh);
						}
					}
				}
			
			
			ds = hbo.gethang();
			
			if(key!=null)
				ds=hbo.TimTen(key);
			
			request.setAttribute("ds",ds);
			request.setAttribute("dsloai", lbo.getloai());
			RequestDispatcher rd = request.getRequestDispatcher("adminhang.jsp");
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
