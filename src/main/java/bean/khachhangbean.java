package bean;

public class khachhangbean {
	private long makh;
	private String tenkh;
	private String diachi;
	private String sdt;
	private String email;
	private String tendn;
	private String mk;
	public khachhangbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public khachhangbean(long makh, String tenkh, String diachi, String sdt, String email, String tendn, String mk) {
		super();
		this.makh = makh;
		this.tenkh = tenkh;
		this.diachi = diachi;
		this.sdt = sdt;
		this.email = email;
		this.tendn = tendn;
		this.mk = mk;
	}
	public long getMakh() {
		return makh;
	}
	public void setMakh(long makh) {
		this.makh = makh;
	}
	public String getTenkh() {
		return tenkh;
	}
	public void setTenkh(String tenkh) {
		this.tenkh = tenkh;
	}
	public String getDiachi() {
		return diachi;
	}
	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTendn() {
		return tendn;
	}
	public void setTendn(String tendn) {
		this.tendn = tendn;
	}
	public String getMk() {
		return mk;
	}
	public void setMk(String mk) {
		this.mk = mk;
	}
	
	
	
}
