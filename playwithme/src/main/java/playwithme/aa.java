/*
작성자: 박기원
초안 작성일: 2023년 9월 06
마지막 변경일: 
목적: db 연결 확인 코드
개정 이력: 
*/


package playwithme;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class aa {
	public static void main(String[] args) {
		// Database connection parameters
		String jdbcUrl = "jdbc:oracle:thin:@project-db-cgi.smhrd.com:1524:xe";
		String username = "cgi_23K_AI2_hacksim_1";
		String password = "smhrd1";

		// Declare the Connection object
		Connection connection = null;

		try {
			// Load the Oracle JDBC driver class
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// Establish the database connection
			connection = DriverManager.getConnection(jdbcUrl, username, password);

			// Check if the connection is successful
			if (connection != null) {
				System.out.println("Oracle Database connection established successfully.");
			} else {
				System.out.println("Failed to establish Oracle Database connection.");
			}
		} catch (ClassNotFoundException e) {
			System.err.println("Oracle JDBC driver not found. Make sure it is added to your classpath.");
		} catch (SQLException e) {
			System.err.println("Database connection error: " + e.getMessage());
		} finally {
			// Close the connection when done (if it was established)
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					System.err.println("Error closing database connection: " + e.getMessage());
				}
			}
		}
	}
}
