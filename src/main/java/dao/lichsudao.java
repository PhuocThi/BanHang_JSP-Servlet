package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;



import bean.lichsubean;
import bean.hangbean;

public class lichsudao {
	
	public ArrayList<lichsubean> getLichSu (long makh) throws Exception {
		ArrayList<lichsubean> lsbean = new ArrayList<lichsubean>();
		
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		
		String sql = "SELECT dbo.hang.mahang, dbo.hang.tenhang, dbo.chitiethd.soluongmua, dbo.hang.gia, dbo.khachhang.makh, dbo.hang.gia * dbo.chitiethd.soluongmua AS thanhtien, dbo.chitiethd.damua, dbo.hoadon.ngaymua, dbo.hoadon.mahd\r\n"
				+ "FROM     dbo.hoadon INNER JOIN\r\n"
				+ "                  dbo.khachhang ON dbo.hoadon.makh = dbo.khachhang.makh INNER JOIN\r\n"
				+ "                  dbo.chitiethd ON dbo.hoadon.mahd = dbo.chitiethd.mahd INNER JOIN\r\n"
				+ "                  dbo.hang ON dbo.chitiethd.mahang = dbo.hang.mahang\r\n"
				+ "where dbo.khachhang.makh = ?";
		
		//B3 : tao cau lenh prepareStatement
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		//B4 : truyen tham so
		
		cmd.setLong(1, makh);
		ResultSet rs = cmd.executeQuery();
		//B5 : Duyet rs de luu vao mang lsbean
		while(rs.next()) {
			String mahang = rs.getString("mahang");
			String tenhang = rs.getString("tenhang");
			long soluongmua = rs.getLong("soLuongmua");
			long gia = rs.getLong("gia");
			long makh1 = rs.getLong("makh");
			long thanhtien = rs.getLong("thanhtien");
			boolean damua = rs.getBoolean("damua");
			Date ngaymua = rs.getDate("ngaymua");
			long mahd = rs.getLong("mahd");
			lsbean.add(new lichsubean(mahang, tenhang, soluongmua, gia, thanhtien, damua, ngaymua,mahd));					
		}
		
		//B6 : Dong ket noi va rs
		rs.close();
		kn.cn.close();
		return lsbean;

	}
	
	
	public ArrayList<String> dsHd (long makh) throws Exception {
		ArrayList<String> dshd = new ArrayList<String>();
		
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		
		String sql = "select distinct mahd \r\n"
				+ "from dbo.VLichSuMuaHang\r\n"
				+ "where makh = ?";
		
		//B3 : tao cau lenh prepareStatement
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		//B4 : truyen tham so
		
		cmd.setLong(1, makh);
		ResultSet rs = cmd.executeQuery();
		//B5 : Duyet rs de luu vao mang lsbean
		while(rs.next()) {
			String mahd = rs.getString("mahd");		
			dshd.add(mahd);
		}
		
		//B6 : Dong ket noi va rs
		rs.close();
		kn.cn.close();
		return dshd;
	}
}
