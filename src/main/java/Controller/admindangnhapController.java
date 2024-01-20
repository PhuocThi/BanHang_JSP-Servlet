package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class admindangnhapController
 */
@WebServlet("/admindangnhapController")
public class admindangnhapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public admindangnhapController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String mk = request.getParameter("adminmk");
			
			if(mk==null) {
				RequestDispatcher rd = request.getRequestDispatcher("admindangnhap.jsp");
				rd.forward(request, response);
			}
			
			if(mk.equals("123")) {
				HttpSession session = request.getSession();
				if(session.getAttribute("admin")==null) {
					session.setAttribute("admin", "dadn");
				}
				response.sendRedirect("adminxacnhanController");
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("admindangnhap.jsp?tb=Sai mat khau admin!");
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
