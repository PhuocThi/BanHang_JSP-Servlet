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

import bean.hangbean;
import bean.loaibean;
import bo.giohangbo;
import bo.hangbo;
import bo.loaibo;

/**
 * Servlet implementation class gioController
 */
@WebServlet("/gioController")
public class gioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public gioController() {
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
					//Lay ve ms, ts va giatam
					String mh = request.getParameter("mh");
					String th = request.getParameter("th");
					String giatam = request.getParameter("gia");
					//Neu ms, ts, giatam khac null
					if(mh!=null && th!=null && giatam!=null){
						giohangbo gh = null;
						
						//Doi giatam tu chuoi ra so
						long gia = Long.parseLong(giatam);
						//Kiem tra neu chua tao session("gh") thi:
						HttpSession session = request.getSession();
						if(session.getAttribute("gh")==null) {
							
							gh = new giohangbo();//new giohangbo();
							session.setAttribute("gh", gh);//tao session("gh")
						}
						//Luu session("gh") vao bien gh
						gh=(giohangbo)session.getAttribute("gh");
						//Goi ham them de them hang vao bien gh
						
							gh.Them(mh, th, gia, 1);
						//Luu gh vao lai session("gh")
						session.setAttribute("gh", gh);
			
						long dem = (long)session.getAttribute("dem");
						dem++;
						session.setAttribute("dem", dem);
		
						//Dieu huong ve lai webpage cu truoc do khi click den 
						//gioController (htsach.jsp)
						String previousURL = request.getHeader("referer");
						response.sendRedirect(previousURL);
						
					} else {
						RequestDispatcher rd = request.getRequestDispatcher("htgio.jsp");
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
