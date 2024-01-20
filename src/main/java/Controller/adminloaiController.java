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

import bean.loaibean;
import bo.loaibo;

/**
 * Servlet implementation class adminloaiController
 */
@WebServlet("/adminloaiController")
public class adminloaiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminloaiController() {
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
					 
			
			String maloai = request.getParameter("txtmaloai");
			String tenloai = request.getParameter("txttenloai");
			String nhacungcap = request.getParameter("txtnhacungcap");
			
			loaibo lbo = new loaibo();
			ArrayList<loaibean> ds = lbo.getloai();
			//Neu nguoi dung chon nut Add
			if(request.getParameter("butadd")!=null) 
				lbo.Them(maloai, tenloai, nhacungcap);
			else if(request.getParameter("butupdate")!=null) 
					lbo.Sua(maloai, tenloai, nhacungcap);
				else { 
					String tab = request.getParameter("tab");
					String ml = request.getParameter("ml");
					if(tab!=null) {
						if(tab.equals("select")) {
							request.setAttribute("tenloai", lbo.TimTenloai(ml));
							request.setAttribute("nhacungcap", lbo.TimNhacungcap(ml));
							request.setAttribute("maloai", ml);
						}
						else
							lbo.Xoa(ml);
					}
				}	
			request.setAttribute("ds", lbo.getloai());
			RequestDispatcher rd = request.getRequestDispatcher("adminloai.jsp");
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
