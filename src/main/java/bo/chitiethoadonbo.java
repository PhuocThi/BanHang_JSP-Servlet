package bo;

import java.util.ArrayList;

import bean.adminxacnhanbean;
import dao.chitiethoadondao;

public class chitiethoadonbo {
	chitiethoadondao cthddao = new chitiethoadondao();
	
	public void Them(String mahang, long soluongmua, long mahd) throws Exception {
		cthddao.Them(mahang, soluongmua, mahd);
	}
	
	public int Sua(long mact) throws Exception {
		return cthddao.Sua(mact);
	}
	
	public ArrayList<adminxacnhanbean> getxacnhan() throws Exception {
		return cthddao.getxacnhan();
	}
}

