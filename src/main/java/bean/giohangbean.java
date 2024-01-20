package bean;

public class giohangbean {
	private String mahang;
	private String tenhang;
	private long gia;
	private long soluongmua;
	private long thanhtien;
	
	public giohangbean() {
		super();
	}

	public giohangbean(String mahang, String tenhang, long gia, long soluongmua) {
		super();
		this.mahang = mahang;
		this.tenhang = tenhang;
		this.gia = gia;
		this.soluongmua = soluongmua;
		this.thanhtien = soluongmua*gia;
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
		return soluongmua*gia;
	}

	public void setThanhtien(long thanhtien) {
		this.thanhtien = thanhtien;
	}

	
	
	
}
