package bean;

import java.util.Date;

public class lichsubean {
	private String mahang;
	private String tenhang;
	private long soluongmua;
	private long gia;
	private long thanhtien;
	private boolean damua;
	private Date ngaymua;
	private long mahd;
	
	
	
	public long getMahd() {
		return mahd;
	}

	public void setMahd(long mahd) {
		this.mahd = mahd;
	}

	public lichsubean() {
		super();

	}

	public lichsubean(String mahang, String tenhang, long soluongmua, long gia, long thanhtien, boolean damua,
			Date ngaymua, long mahd) {
		super();
		this.mahang = mahang;
		this.tenhang = tenhang;
		this.soluongmua = soluongmua;
		this.gia = gia;
		this.thanhtien = thanhtien;
		this.damua = damua;
		this.ngaymua = ngaymua;
		this.mahd = mahd;
	}

	public String getMahang() {
		return mahang;
	}

	public void setMahang(String mahang) {
		this.mahang = mahang;
	}

	public String getTenhang() {
		return tenhang;
	}

	public void setTenhang(String tenhang) {
		this.tenhang = tenhang;
	}

	public long getSoluongmua() {
		return soluongmua;
	}

	public void setSoluongmua(long soluongmua) {
		this.soluongmua = soluongmua;
	}

	public long getGia() {
		return gia;
	}

	public void setGia(long gia) {
		this.gia = gia;
	}

	public long getThanhtien() {
		return gia*soluongmua;
	}

	public void setThanhtien(long thanhtien) {
		this.thanhtien = thanhtien;
	}

	public boolean isDamua() {
		return damua;
	}

	public void setDamua(boolean damua) {
		this.damua = damua;
	}

	public Date getNgaymua() {
		return ngaymua;
	}

	public void setNgaymua(Date ngaymua) {
		this.ngaymua = ngaymua;
	}


	
}	
