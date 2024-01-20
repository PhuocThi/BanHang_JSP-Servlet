package bean;

import java.util.Date;

public class adminxacnhanbean {
	private long machitiethd;
	private String tenkh;
	private String tenhang;
	private long gia;
	private long soluongmua;
	private long thanhtien;
	private Date ngaymua;
	private long mahd;
	private boolean damua;
	public adminxacnhanbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public adminxacnhanbean(long machitiethd, String tenkh, String tenhang, long gia, long soluongmua, long thanhtien,
			Date ngaymua, long mahd, boolean damua) {
		super();
		this.machitiethd = machitiethd;
		this.tenkh = tenkh;
		this.tenhang = tenhang;
		this.gia = gia;
		this.soluongmua = soluongmua;
		this.thanhtien = thanhtien;
		this.ngaymua = ngaymua;
		this.mahd = mahd;
		this.damua = damua;
	}
	public long getMahd() {
		return mahd;
	}
	public void setMahd(long mahd) {
		this.mahd = mahd;
	}
	public long getMachitiethd() {
		return machitiethd;
	}
	public void setMachitiethd(long machitiethd) {
		this.machitiethd = machitiethd;
	}
	public String getTenkh() {
		return tenkh;
	}
	public void setTenkh(String tenkh) {
		this.tenkh = tenkh;
	}
	public String getTenhang() {
		return tenhang;
	}
	public void setTenhang(String tenhang) {
		this.tenhang = tenhang;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	public long getSoluongmua() {
		return soluongmua;
	}
	public void setSoluongmua(long soluongmua) {
		this.soluongmua = soluongmua;
	}
	public long getThanhtien() {
		return thanhtien;
	}
	public void setThanhtien(long thanhtien) {
		this.thanhtien = thanhtien;
	}
	public Date getNgaymua() {
		return ngaymua;
	}
	public void setNgaymua(Date ngaymua) {
		this.ngaymua = ngaymua;
	}
	public boolean isDamua() {
		return damua;
	}
	public void setDamua(boolean damua) {
		this.damua = damua;
	}
	
	
	
	
	
}
