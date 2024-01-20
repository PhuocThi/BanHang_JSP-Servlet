package bean;

public class hangbean {
	private String mahang;
	private String tenhang;
	private long soluongton;
	private long gia;
	private String anh;
	private String chatlieu;
	private String maloai;
	public hangbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public hangbean(String mahang, String tenhang, long soluongton, long gia, String anh, String chatlieu,
			String maloai) {
		super();
		this.mahang = mahang;
		this.tenhang = tenhang;
		this.soluongton = soluongton;
		this.gia = gia;
		this.anh = anh;
		this.chatlieu = chatlieu;
		this.maloai = maloai;
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
	public long getSoluongton() {
		return soluongton;
	}
	public void setSoluongton(long soluongton) {
		this.soluongton = soluongton;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	public String getChatlieu() {
		return chatlieu;
	}
	public void setChatlieu(String chatlieu) {
		this.chatlieu = chatlieu;
	}
	public String getMaloai() {
		return maloai;
	}
	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}
	
	
}
