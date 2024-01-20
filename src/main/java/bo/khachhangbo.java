package bo;

import java.util.ArrayList;

import bean.khachhangbean;
import dao.khachhangdao;

public class khachhangbo {
	khachhangdao khdao = new khachhangdao();
	public khachhangbean ktdn (String tendn, String pass) throws Exception { 
		return khdao.ktdn(tendn, pass);
	}
	
	public boolean ktdangky (String tendn) throws Exception {
		return khdao.ktdangky(tendn);
	}
	
	public void dangky (String hoten, String diachi, String sodt, String email, String tendn,
			String pass) throws Exception {
		 khdao.dangky(hoten, diachi, sodt, email, tendn, pass);
	}
	
	public ArrayList<khachhangbean> getKhachhang() throws Exception {
		return khdao.getKhachhang();
	}
	
	public long soHangDaDatMua(long makh) throws Exception {
		return khdao.soHangDaDatMua(makh);
	}
	
	public long soHangDaThanhToan(long makh) throws Exception {
		return khdao.soHangDaThanhToan(makh);
	}
}
