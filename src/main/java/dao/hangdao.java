package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import bean.hangbean;

public class hangdao {
	public ArrayList<hangbean> gethang() throws Exception {
		ArrayList<hangbean> ds = new ArrayList<hangbean>();
		
		//B1 : Ket noi vao csdl
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		//B2 : Tao cau lenh sql
		String sql = "select * from hang";
		//B3 : Tao cau lenh prepare Statement
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//B4 : Thuc hien cau lenh
		ResultSet rs = cmd.executeQuery();
		//B5 : Duyet rs de luu vao mang ds
		while(rs.next()) {
			String mahang = rs.getString("mahang");
			String tenhang = rs.getString("tenhang");
			long soluongton = rs.getLong("soluongton");
			long gia = rs.getLong("gia");
			String anh = rs.getString("anh");
			String chatlieu = rs.getString("chatlieu");
			String maloai = rs.getString("maloai");
			ds.add(new hangbean(mahang, tenhang, soluongton, gia, anh, chatlieu, maloai));					
		}
		
		//B6 : Dong ket noi va rs
		rs.close();
		kn.cn.close();
		return ds;
		
	}
	
	public int Them(String mahang, String tenhang, long soluongton, long gia, String anh, String chatlieu, String maloai ) 
			throws Exception { 
		//B1 : ket noi
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		//B2 : Tao cau lenh sql
		String sql = "insert into hang(mahang, tenhang, soluongton, gia, anh, chatlieu, maloai) values(?,?,?,?,?,?,?)";
		
		//B3 : tao cau lenh prepareStatement
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		//B4 : truyen tham so
		cmd.setString(1, mahang);
		cmd.setString(2, tenhang);
		cmd.setLong(3, soluongton);
		cmd.setLong(4, gia);
		cmd.setString(5, anh);
		cmd.setString(6, chatlieu);
		cmd.setString(7, maloai);
		
		int kq = cmd.executeUpdate();
		//B5 : Dong ket noi va rs
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	public ArrayList<String> getChatlieu() throws Exception {
		ArrayList<String> dschatlieu = new ArrayList<String>();
		
		//B1 : Ket noi vao csdl
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		//B2 : Tao cau lenh sql
		String sql = "select distinct chatlieu\r\n"
					+ "from hang";
		//B3 : Tao cau lenh prepare Statement
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//B4 : Thuc hien cau lenh
		ResultSet rs = cmd.executeQuery();
		//B5 : Duyet rs de luu vao mang ds
		while(rs.next()) {
			String chatlieu = rs.getString("chatlieu");
			dschatlieu.add(chatlieu);					
		}
		
		//B6 : Dong ket noi va rs
		rs.close();
		kn.cn.close();
		return dschatlieu;
	}
	
	public int Xoa(String mahang) throws Exception { 
		
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		
		String sql = "delete from hang where mahang=?";
		
		//B3 : tao cau lenh prepareStatement
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		//B4 : truyen tham so
		cmd.setString(1, mahang);
		int kq = cmd.executeUpdate();
		//B5 : Dong ket noi va rs
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	public boolean ktthemhang (String mahang) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "select mahang from dbo.hang";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			String getmahang = rs.getString("mahang");
			if(mahang.equals(getmahang)==true) {
				return false;
			} else ;
		}
		return true;
	}
 	
}
