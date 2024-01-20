package dao;

import java.util.ArrayList;
import java.util.Date;

import bean.adminxacnhanbean;
import bean.loaibean;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

public class chitiethoadondao {
		public void Them(String mahang, long soluongmua, long mahd) throws Exception {
			//B1 : ket noi
			ketnoidao kn = new ketnoidao();
			kn.ketnoi();
			//B2 : Tao cau lenh sql
			String sql = "insert into dbo.chitiethd(mahang,soluongmua,mahd,damua) values(?,?,?,?)";
			
			//B3 : tao cau lenh prepareStatement
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			
			//B4 : truyen tham so
			cmd.setString(1, mahang);
			cmd.setLong(2, soluongmua);
			cmd.setLong(3, mahd);
			cmd.setBoolean(4, false);
			
			cmd.executeUpdate();
			//B5 : Dong ket noi va rs
			cmd.close();
			kn.cn.close();

		}
		
		public int Sua(long mact) throws Exception {
			//B1 : ket noi
			ketnoidao kn = new ketnoidao();
			kn.ketnoi();
			//B2 : Tao cau lenh sql
			String sql = "update chitiethd\r\n"
					+ "set damua = 1\r\n"
					+ "where machitiet = ?";			
			//B3 : tao cau lenh prepareStatement
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			
			//B4 : truyen tham so
			cmd.setLong(1, mact);	
			int kq = cmd.executeUpdate(); //Thuc hien cau lenh sql
			//B5 : Dong ket noi va rs
			cmd.close();
			kn.cn.close();
			return kq;
		}
		
		public ArrayList<adminxacnhanbean> getxacnhan() throws Exception {
			ArrayList<adminxacnhanbean> ds= new ArrayList<adminxacnhanbean>();
			//B1 : Ket noi vao csdl
			ketnoidao kn = new ketnoidao();
			kn.ketnoi();
			//B2 : Tao cau lenh sql
			String sql = "select * from VAdminXacNhan";
			//B3 : Tao cau lenh prepare Statement
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			//B4 : Thuc hien cau lenh
			ResultSet rs = cmd.executeQuery();
			//B5 : Duyet rs de luu vao mang ds
			while(rs.next()) {
				 long machitiethd = rs.getLong("machitiet");
				 String tenkh = rs.getString("tenkh");
				 String tenhang = rs.getString("tenhang");
				 long gia = rs.getLong("gia");
				 long soluongmua = rs.getLong("soluongmua");
				 long thanhtien = rs.getLong("thanhtien");
				 Date ngaymua = rs.getDate("ngaymua");
				 long mahd = rs.getLong("mahd");
				 boolean damua = rs.getBoolean("damua");
				 ds.add(new adminxacnhanbean(machitiethd, tenkh, tenhang, gia, soluongmua, thanhtien, ngaymua, mahd, damua));	
			}
			//B6 : Dong ket noi va rs
			rs.close();
			kn.cn.close();		
			return ds;
		}
}

