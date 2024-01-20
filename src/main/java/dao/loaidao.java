package dao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import bean.loaibean;
public class loaidao {
	public ArrayList<loaibean> getloai()throws Exception{
		ArrayList<loaibean> ds= new ArrayList<loaibean>();
		//B1 : Ket noi vao csdl
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		//B2 : Tao cau lenh sql
		String sql = "select * from loai";
		//B3 : Tao cau lenh prepare Statement
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//B4 : Thuc hien cau lenh
		ResultSet rs = cmd.executeQuery();
		//B5 : Duyet rs de luu vao mang ds
		while(rs.next()) {
			String maloai = rs.getString("maloai");
			String tenloai = rs.getString("tenloai");
			String nhacungcap = rs.getString("nhacungcap");
			ds.add(new loaibean(maloai, tenloai, nhacungcap));
			
		}
		//B6 : Dong ket noi va rs
		rs.close();
		kn.cn.close();		
		return ds;
	}
	
	public int Them(String maloai, String tenloai, String nhacungcap) throws Exception { 
		//B1 : ket noi
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		//B2 : Tao cau lenh sql
		String sql = "insert into loai(maloai,tenloai,nhacungcap) values(?,?,?)";
		
		//B3 : tao cau lenh prepareStatement
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		//B4 : truyen tham so
		cmd.setString(1, maloai);
		cmd.setString(2, tenloai);
		cmd.setString(3, nhacungcap);
			
		int kq = cmd.executeUpdate();
		//B5 : Dong ket noi va rs
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	public int Xoa(String maloai) throws Exception { 
		//B1 : ket noi
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		//B2 : Tao cau lenh sql
		String sql = "delete from loai where maloai=?";
		
		//B3 : tao cau lenh prepareStatement
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		//B4 : truyen tham so
		cmd.setString(1, maloai);
		int kq = cmd.executeUpdate();
		//B5 : Dong ket noi va rs
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	public int Sua(String maloai, String tenloaimoi, String nhacungcapmoi) throws Exception { 
		//B1 : ket noi
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		//B2 : Tao cau lenh sql
		String sql = "update loai set tenloai = ?,nhacungcap = ? where maloai= ?";	
		//B3 : tao cau lenh prepareStatement
		PreparedStatement cmd = kn.cn.prepareStatement(sql);		
		//B4 : truyen tham so
		cmd.setString(1, tenloaimoi);
		cmd.setString(2, nhacungcapmoi);
		cmd.setString(3, maloai);
		
		int kq = cmd.executeUpdate();
		//B5 : Dong ket noi va rs
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	
}
