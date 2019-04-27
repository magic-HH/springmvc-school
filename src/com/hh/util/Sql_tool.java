package com.hh.util;
import java.sql.*;

public class Sql_tool {
	static Connection con = null;
	public static Connection getCon(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/food?user=root&password=1234&characterEncoding=utf-8");
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	public static void stopCon() throws SQLException {
		con.close();
	}
	
	
	
}
