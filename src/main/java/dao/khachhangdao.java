package dao;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.hangbean;
import bean.khachhangbean;

public class khachhangdao {
	public khachhangbean ktdn (String tendn, String mk) throws Exception {
				
			ketnoidao kn = new ketnoidao();
			kn.ketnoi();
			
			String sql = "select * from khachhang where tendn=? and mk=?";
		
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
				
			cmd.setString(1, tendn);
			cmd.setString(2, mk);
			
			ResultSet rs = cmd.executeQuery();
			khachhangbean kh = null;
			if(rs.next()) { //Dang nhap dung
				long makh = rs.getLong("makh");
				String tenkh = rs.getString("tenkh");
				String diachi = rs.getString("diachi");
				String sdt = rs.getString("sdt");
				String email = rs.getString("email");
				kh= new khachhangbean(makh, tenkh, diachi, sdt, email, tendn, mk);
			}
			return kh;
		}
	
	public boolean ktdangky (String tendn) throws Exception{
		boolean kq = false;

		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "select tendn as tendn from dbo.khachhang";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		
		while(rs.next()) {
			String gettendn = rs.getString("tendn");
			if((tendn.equals(gettendn))==true) {
				return false;
			}  else kq = true;
		}
		return kq;

	}
	
	public void dangky (String tenkh, String diachi, String sdt, String email, String tendn,
			String mk) throws Exception {
		//B1 : Ket noi vao csdl
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		//B2 : Tao cau lenh sql
		String sql = "insert into dbo.khachhang (tenkh, diachi, sdt, email, tendn, mk) values (?,?,?,?,?,?)";
		//B3 : Tao cau lenh prepare Statement
	
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//B4 : Truyen tham so vao cau lenh sql
		cmd.setString(1, tenkh);
		cmd.setString(2, diachi);
		cmd.setString(3, sdt);
		cmd.setString(4, email);
		cmd.setString(5, tendn);
		cmd.setString(6, mk);
		
		cmd.executeUpdate();

		
	}
	
	public ArrayList<khachhangbean> getKhachhang() throws Exception {
		ArrayList<khachhangbean> ds = new ArrayList<khachhangbean>();
			
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		
		String sql = "select * from khachhang";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();

		while(rs.next()) {
			long makh = rs.getLong("makh");
			String tenkh = rs.getString("tenkh");
			String diachi = rs.getString("diachi");
			String sdt = rs.getString("sdt");
			String email = rs.getString("email");
			String tendn = rs.getString("tendn");
			String mk = rs.getString("mk");
			ds.add(new khachhangbean(makh, tenkh, diachi, sdt, email, tendn, mk));					
		}
		
		//B6 : Dong ket noi va rs
		rs.close();
		kn.cn.close();
		return ds;
		
	}
	
	public long soHangDaDatMua(long makh) throws Exception {
		long kq=0;
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		
		String sql = "select sum(soluongmua) as dadatmua\r\n"
				+ "from VLichSuMuaHang\r\n"
				+ "where makh= ? ";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, makh);
		
		//B6 : Dong ket noi va rs
		
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			kq = rs.getLong("dadatmua");
		}
		rs.close();
		kn.cn.close();
		return kq;
		
	}
	
	public long soHangDaThanhToan(long makh) throws Exception {
		long kq=0;
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		
		String sql = "select sum(soluongmua) as dathanhtoan\r\n"
				+ "from VLichSuMuaHang\r\n"
				+ "where makh=?\r\n"
				+ "and damua='true' ";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, makh);
		
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			kq = rs.getLong("dathanhtoan");
		}
		rs.close();
		kn.cn.close();
		return kq;	
	}
}

