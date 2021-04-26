package com.ly.bigdata.until;

import java.io.IOException;
import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

public class DBUtils {

	// 获取连接
	public static Connection getConnection() {
		Connection conn = null;
		Properties pro = new Properties();
		// 1. 加载驱动
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		try {
			// 读取配置文件
			pro.load(DBUtils.class.getClassLoader().getResourceAsStream("jdbc.properties"));
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		// 2. 建立连接
		try {
			// conn = DriverManager.getConnection(pro.getProperty("url"),
			// pro.getProperty("user"),pro.getProperty("password"));
			conn = DriverManager.getConnection(pro.getProperty("url"), pro);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	// 释放资源
	public static void release(Connection conn, PreparedStatement pst, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pst != null) {
			try {
				pst.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// 增删改的方法
	public static int executeSql(String sql, Object... params) {
		Connection conn = null;
		PreparedStatement pst = null;
		int row = 0;
		try {
			// 2. 建立连接
			conn = DBUtils.getConnection();
			// 3. 发送sql,获取返回结果
			pst = conn.prepareStatement(sql);
			// 参数赋值
			for (int i = 0; i < params.length; i++) {
				pst.setObject(i + 1, params[i]);
			}
			row = pst.executeUpdate();
			// 4. 处理结果
			System.out.println("影响的行数：" + row);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 5. 释放资源
			DBUtils.release(conn, pst, null);
		}
		return row;
	}

	// 增删改的方法
	public static int executeSql(Connection conn, String sql, Object... params) {
		PreparedStatement pst = null;
		int row = 0;
		try {
			// 3. 发送sql,获取返回结果
			pst = conn.prepareStatement(sql);
			// 参数赋值
			for (int i = 0; i < params.length; i++) {
				pst.setObject(i + 1, params[i]);
			}
			row = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 5. 释放资源
			DBUtils.release(null, pst, null);
		}
		return row;
	}

	public static <T> List<T> executeQuery(Class<T> clazz, String sql, Object... params) {
		List<T> list = new ArrayList<T>();
		T t = null;
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			// 2. 建立连接
			conn = DBUtils.getConnection();
			// 3. 发送sql,获取返回结果
			pst = conn.prepareStatement(sql);
			// 参数赋值
			for (int i = 0; i < params.length; i++) {
				pst.setObject(i + 1, params[i]);
			}
			rs = pst.executeQuery();
			// 元数据
			ResultSetMetaData rsmd = rs.getMetaData();

			// System.out.println(rsmd.getColumnCount());
			// System.out.println(rsmd.getColumnLabel(2));

			// 处理结果集
			while (rs.next()) {
				Map<String, Object> map = new HashMap<>();
				for (int i = 0; i < rsmd.getColumnCount(); i++) {
					map.put(rsmd.getColumnLabel(i + 1), rs.getObject(i + 1));
				}
				// 通过反射创建一个对象
				try {
					t = clazz.newInstance();
				} catch (InstantiationException | IllegalAccessException e) {
					e.printStackTrace();
				}
				// 遍历map
				for (Map.Entry<String, Object> entry : map.entrySet()) {
					// 数据库label
					String lable = entry.getKey();
					// label对应的数据
					Object value = entry.getValue();

					// 通过反射给属性赋值
					try {
						Field f = clazz.getDeclaredField(lable);
						f.setAccessible(true);
						f.set(t, value);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				list.add(t);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.release(conn, pst, rs);
		}
		return list;
	}

	public static <T> T executeQueryOne(Class<T> clazz, String sql, Object... params) {
		List<T> list = executeQuery(clazz, sql, params);
		if (!list.isEmpty()) {
			return list.get(0);
		}
		return null;
	}

}
