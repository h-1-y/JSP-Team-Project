package mvc.review.database;

public class DBTest {

	public static void main(String[] args) {
		
		DBCon con = DBCon.getInstance();
		
		con.getConnection();
		
		if(con!=null) System.out.println("연결성공!");
		else System.out.println("연결실패!");
		
	}
	
}
