package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.giohangbo;

/**
 * Servlet implementation class suaController
 */
@WebServlet("/suaController")
public class suaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public suaController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			giohangbo gh;
			String slmoi = request.getParameter("txtsl");
			String mahang = request.getParameter("mh");
			String soluongcu = request.getParameter("sl");
			if(mahang!=null && slmoi!=null && soluongcu!=null) {
				HttpSession session = request.getSession();
				//Luu session("gh") ra bien gh
				gh = (giohangbo)session.getAttribute("gh");
				long sl = Long.parseLong(slmoi);
				gh.Sua(mahang, sl);
				session.setAttribute("gh", gh); //Luu bien vao lai session
				
				long slcu = Long.parseLong(soluongcu);
				long dem = (long) session.getAttribute("dem");
				dem=dem+(sl-slcu);
				session.setAttribute("dem", dem);
				RequestDispatcher rd = request.getRequestDispatcher("htgio.jsp");
				rd.forward(request, response);
			}
			else {
				response.sendRedirect("gioController");
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
