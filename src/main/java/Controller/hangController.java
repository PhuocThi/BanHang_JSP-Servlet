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
import bean.hangbean;
import bo.loaibo;
import bo.hangbo;

/**
 * Servlet implementation class sachController
 */
@WebServlet("/hangController")
public class hangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public hangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//Dat cau hinh gui len va lay ve =utf-8
			request.setCharacterEncoding("utf-8"); 
			response.setCharacterEncoding("utf-8");
			
			loaibo lbo = new loaibo();
			ArrayList<loaibean> dsloai = lbo.getloai();
			

			String ml = request.getParameter("ml");
			String key = request.getParameter("txttim");
			String chatlieu = request.getParameter("chatlieu");
			
			hangbo hbo = new hangbo();
			ArrayList<hangbean> dshang = hbo.gethang();	
			ArrayList<String> dschatlieu = hbo.getChatlieu();	
			
			//Neu ml!=null thi goi ham TimMa
			//Neu key!=null goi ham Tim
			if(ml!=null)
				dshang=hbo.TimMa(ml);
			if(key!=null)
				dshang=hbo.TimTen(key);
			if(chatlieu!=null)
				dshang = hbo.TimChatLieu(chatlieu);

			HttpSession session = request.getSession();
			request.setAttribute("dshang", dshang);
			session.setAttribute("dsloai", dsloai);
			session.setAttribute("dschatlieu", dschatlieu);
			
			RequestDispatcher rd = request.getRequestDispatcher("hthang.jsp");
			rd.forward(request, response);
			
						
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
