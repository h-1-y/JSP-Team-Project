package mvc.review.database;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBCon {
	// 자신타입의 instance 필드
	private static DBCon instance = new DBCon();
	// 생성자 캡슐화
	private DBCon() {}
	// 인스턴스 얻기 메소드
	public static DBCon getInstance() {
		return instance;
	}
	
	// 외부에서 접근 가능한 getConnection() 메소드
	public Connection getConnection() {
		
		Connection con = null;
		String url = "jdbc:mysql://localhost:3306/SemiProject?useSSL=false";
		String user = "root";
		String password = "1234";
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection(url, user, password);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		return con;
	}
}
