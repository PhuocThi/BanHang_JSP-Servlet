package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.chitiethoadonbo;

/**
 * Servlet implementation class adminxacnhanController
 */
@WebServlet("/adminxacnhanController")
public class adminxacnhanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminxacnhanController() {
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
			
			//Lay ve mact can xac nhan
			String mact = request.getParameter("mact");
			chitiethoadonbo ct = new chitiethoadonbo();
			if(mact!=null)
				ct.Sua(Long.parseLong(mact)); //Sua damua = 0 -> 1 trong bang CTHD
			
			//Lay ve danh sach cac hoa don chua xac nhan
			request.setAttribute("ds", ct.getxacnhan());
			
			RequestDispatcher rd = request.getRequestDispatcher("adminxacnhan.jsp"); 
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
