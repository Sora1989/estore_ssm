package com.lunxuu.estore.utils;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class DBUtils {
	private static final ComboPooledDataSource DATA_SOURCE = new ComboPooledDataSource();
	private static final ThreadLocal<Connection> TL = new ThreadLocal<Connection>();

	// 获取数据源
	public static DataSource getDataSource() {
		return DATA_SOURCE;
	}

	public static Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			conn = TL.get(); // 线程本身就是key值，所有不需要传递
			if (conn == null) {
				conn = DATA_SOURCE.getConnection();
				TL.set(conn);
			}
			return conn;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 获取连接
	public static Connection getConnection2() throws SQLException {
		return DATA_SOURCE.getConnection();
	}
	
	public static void main(String[] args) throws SQLException {
		for (int i = 0; i < 10; i++) {
			System.out.println(getConnection());
		}
	}
}
