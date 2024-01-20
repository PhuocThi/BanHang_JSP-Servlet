package bo;

import java.util.ArrayList;

import bean.loaibean;
import dao.loaidao;

public class loaibo {
	loaidao ldao = new loaidao();
	ArrayList<loaibean> ds;
	public ArrayList<loaibean> getloai()throws Exception {
		ds=ldao.getloai();
		return ds;
	}
	
	public int Them(String maloai, String tenloai, String nhacungcap) throws Exception { 
		for(loaibean loai:ds)
			if(loai.getMaloai().equals(maloai))
				return 0;
		return ldao.Them(maloai, tenloai, nhacungcap);
	}
	
	public String TimTenloai(String maloai) throws Exception { 
		for(loaibean loai:ds)
			if(loai.getMaloai().equals(maloai))
				return loai.getTenloai();
		return null;
	}
	
	public String TimNhacungcap(String maloai) throws Exception { 
		for(loaibean loai:ds)
			if(loai.getMaloai().equals(maloai))
				return loai.getNhacungcap();
		return null;
	}
	
	public int Xoa(String maloai) throws Exception {
		return ldao.Xoa(maloai);
	}
	
	public int Sua(String maloai, String tenloaimoi, String nhacungcapmoi) throws Exception {
		return ldao.Sua(maloai, tenloaimoi, nhacungcapmoi);
	}
}

