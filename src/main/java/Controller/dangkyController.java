package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.khachhangbo;

/**
 * Servlet implementation class dangkyController
 */
@WebServlet("/dangkyController")
public class dangkyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dangkyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String tenkh = request.getParameter("tenkh");
			String tentk = request.getParameter("tentk");
			String mk = request.getParameter("mk");
			String diachi = request.getParameter("diachi");
			String sdt = request.getParameter("sdt");
			String email = request.getParameter("email");
			
			if(tenkh==null && tentk==null && mk==null && diachi==null  
					   && sdt==null && email==null) {
				RequestDispatcher rd = request.getRequestDispatcher("dangky.jsp");
				rd.forward(request, response);
			}
			
			if(tenkh!=null && tentk!=null && mk!=null && diachi!=null  
			   && sdt!=null && email!=null) {
					khachhangbo khbo = new khachhangbo();
					
					if((khbo.ktdangky(tentk)==false)) {
						RequestDispatcher rd = request.getRequestDispatcher("dangky.jsp?tb1=1");
						rd.forward(request, response);
					} else if
						(tenkh.equals("") || tentk.equals("") || mk.equals("") ||sdt.equals("")){
						RequestDispatcher rd = request.getRequestDispatcher("dangky.jsp?tb2=1");
						rd.forward(request, response);
					} else {
						HttpSession session = request.getSession();
						session.removeAttribute("dn"); 
						khbo.dangky(tenkh, diachi, sdt, email, tentk, mk);
						RequestDispatcher rd = request.getRequestDispatcher("dangnhap.jsp?dkythcong=1");
						rd.forward(request, response);
					}
					
			
						
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("dangky.jsp");
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
