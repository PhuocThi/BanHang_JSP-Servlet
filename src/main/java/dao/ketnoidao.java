package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ketnoidao {
	public Connection cn;
	public void ketnoi() throws Exception {
		//B1 : Xac dinh hqtcsdl
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		System.out.println("Da xac dinh hqtcsdl");
		String url = "jdbc:sqlserver://21AK22-COM\\MSSQLSERVER03:1433;databaseName=banhang;user=sa; password=123";
		cn = DriverManager.getConnection(url);
		System.out.println("Da ket noi");
	}
}


