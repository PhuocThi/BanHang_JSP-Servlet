package bo;

import java.util.ArrayList;
import java.util.Iterator;

import bean.giohangbean;

public class giohangbo {
	//luu all sach vao ds
	public ArrayList<giohangbean> ds = new ArrayList<giohangbean>();
	
	public void Them(String mahang, String tenhang, long gia, long soluongmua) 
				throws Exception {
		//kiem tra hang da co chua, neu co thi tang so luong
		for(giohangbean h:ds)
			if(h.getMahang().equals(mahang)) {
				h.setSoluongmua(h.getSoluongmua()+soluongmua);
				return;
			}
		
		giohangbean g = new giohangbean(mahang, tenhang, gia, soluongmua);
		ds.add(g);
	}
	
	public void Xoa(String mahang) throws Exception {
		for(giohangbean h:ds)
			if(h.getMahang().equals(mahang))  {
				ds.remove(h);
				return;
			}
	}
	
	public void Sua(String mahang, long slmoi) throws Exception {
		int n=ds.size();
		for(int i=0;i<n;i++) {
			giohangbean h = ds.get(i);
			if(h.getMahang().equals(mahang)) {
				h.setSoluongmua(slmoi); //sua lai so luong
				ds.set(i, h); //sua lai hang o vi tri i
				return;
			}
		}
	}
	
	public long Tong() throws Exception {
		long s=0;
		for(giohangbean h:ds)
			s += h.getThanhtien();
		return s;
	}
}
