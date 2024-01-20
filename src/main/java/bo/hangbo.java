package bo;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

import bean.hangbean;
import dao.hangdao;

public class hangbo {
	hangdao hdao = new hangdao();
	ArrayList<hangbean> ds;
	ArrayList<String> dschatlieu;
	
	public ArrayList<hangbean> gethang() throws Exception {
		ds=hdao.gethang();
		return ds;
	}
	
	public ArrayList<String> getChatlieu() throws Exception {
		dschatlieu=hdao.getChatlieu();
		return dschatlieu;
	}
	
	
	//Viet ham de tim hang theo ma loai
	public ArrayList<hangbean> TimMa(String maloai) throws Exception {
		ArrayList<hangbean> tam = new ArrayList<hangbean>();
		for(hangbean s: ds) 
			if(s.getMaloai().equals(maloai))
				tam.add(s);
		return tam;
	}
	
	//Viet ham de tim hang theo chatlieu
		public ArrayList<hangbean> TimChatLieu(String chatlieu) throws Exception {
			ArrayList<hangbean> tam = new ArrayList<hangbean>();
			for(hangbean s: ds) 
				if(s.getChatlieu().equals(chatlieu))
					tam.add(s);
			return tam;
		}
	
	//Viet ham de tim theo ten hang
	public ArrayList<hangbean> TimTen(String key) throws Exception {
		ArrayList<hangbean> tam = new ArrayList<hangbean>();
		for(hangbean s: ds) 
			if(s.getTenhang().toLowerCase().contains(key.toLowerCase()))
				tam.add(s);
		return tam;
	}
	
	public int Them(String mahang, String tenhang, long soluongton, long gia, String anh, String chatlieu, String maloai ) 
			throws Exception { 
		return hdao.Them(mahang, tenhang, soluongton, gia, anh, chatlieu, maloai);
	}
	
	public int Xoa(String mahang) throws Exception {
		return hdao.Xoa(mahang);
	}
	
	public boolean ktthemhang (String mahang) throws Exception {
		return hdao.ktthemhang(mahang);
	}
}

