package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import bean.hangbean;

public class hoadondao {
	public int Them(long makh) throws Exception {
		//B1: Ket noi vao csdl
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		//B2:Tao cau lenh sql
		String sql ="insert into hoadon (makh,ngaymua,damua) values (?,?,?)";
		//B3:Tao cau lenh prepareStatement
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//b4 truyen tham so
		cmd.setLong(1, makh);
		//lay ngay gio hien tai
		Date n = new Date();
		SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
		String nn = dd.format(n);
		Date n2 = dd.parse(nn);
		//doi ngay until sang ngay sql
		cmd.setDate(2, new java.sql.Date(n2.getTime()));
		cmd.setBoolean(3, false);
		int kq =cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	public long Maxhd() throws Exception {
		//B1: Ket noi vao csdl
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		//B2:Tao cau lenh sql
		String sql ="select max(mahd) as HDLN from hoadon";
		//B3:Tao cau lenh prepareStatement
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		long max =0;
		if(rs.next()) {
			max=rs.getLong(1);
		}
		rs.close();
		kn.cn.close();
		return max;
	}
}
