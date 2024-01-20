package bean;

public class loaibean {
	private String maloai;
	private String tenloai;
	private String nhacungcap;
	
	public loaibean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public loaibean(String maloai, String tenloai, String nhacungcap) {
		super();
		this.maloai = maloai;
		this.tenloai = tenloai;
		this.nhacungcap = nhacungcap;
	}

	public String getMaloai() {
		return maloai;
	}

	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}

	public String getTenloai() {
		return tenloai;
	}

	public void setTenloai(String tenloai) {
		this.tenloai = tenloai;
	}

	public String getNhacungcap() {
		return nhacungcap;
	}

	public void setNhacungcap(String nhacungcap) {
		this.nhacungcap = nhacungcap;
	}
	
	
}


