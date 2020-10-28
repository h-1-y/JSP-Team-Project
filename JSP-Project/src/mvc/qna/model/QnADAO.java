package mvc.qna.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mvc.review.database.DBCon;
import mvc.review.model.ReviewDTO;

public class QnADAO {

	private static QnADAO instance = new QnADAO();
	
	private QnADAO() {}
	
	public static QnADAO getInstance() {
		return instance;
	}
	
	public int getQnAListCount() {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
		String sql = "select count(*) from qnaBoard";
		
		try {
			
			//DB연결하기
			con = DBCon.getInstance().getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) x = rs.getInt(1);
			
		} catch (Exception e) {

			System.out.println("getQnAListCount() method error : " + e);
			
		} finally {
			
			try {
				
				if(con!=null) con.close();
				if(pstmt!=null) pstmt.close();
				if(rs!=null) rs.close();
				
			} catch (Exception e) {

				throw new RuntimeException(e.getMessage());	
			}
		}
		return x;
	}



	public List<QnADTO> getQnABoardList(int qpageNum, int max){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int total_list = getQnAListCount();
		
		int start = (qpageNum - 1) * max;
		
		int index = start + 1;
		
		String sql = "select * from qnaBoard order by num desc";
		
		ArrayList<QnADTO> qnalist = new ArrayList<QnADTO>();
		
		try {
			
			con = DBCon.getInstance().getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.absolute(index)) {
				
				QnADTO qna = new QnADTO();
				
				qna.setNum(rs.getInt("num"));
				qna.setId(rs.getString("id"));
				qna.setP_name(rs.getString("p_name"));
				qna.setQnapassword(rs.getString("qnapassword"));
				qna.setQnacategory(rs.getString("qnacategory"));
				qna.setContent(rs.getString("content"));
				qna.setRegist_day(rs.getString("regist_day"));
				qna.setResult(rs.getString("result"));
				qna.setAnswer(rs.getString("Answer"));
				
				
				qnalist.add(qna);
				// 한 페이지 글 제한 갯수(5) 이내면 증가
				if(index < (start+max) && index <= total_list) index ++;
				else break;
				
			}
			
			} catch (Exception e) {
			
			System.out.println("getQnAList() method error : " + e);
		
			} finally {
			
				try {
					
					if(rs!=null) rs.close();
					if(pstmt!=null) pstmt.close();
					if(con!=null) con.close();
				
				} catch (Exception e) {
				
					throw new RuntimeException(e.getMessage());
				
				}
			
			}
		return qnalist;
	}

	public QnADTO getQnaByNum(int num, int qpageNum) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		QnADTO qna = null;
		
		try {
			
			con = DBCon.getInstance().getConnection();
			String sql = "select * from qnaBoard where num = ?";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				qna = new QnADTO();
				qna.setNum(rs.getInt("num"));
				qna.setId(rs.getString("id"));
				qna.setP_name(rs.getString("p_name"));
				qna.setQnapassword(rs.getString("qnapassword"));
				qna.setQnacategory(rs.getString("qnacategory"));
				qna.setContent(rs.getString("content"));
				qna.setRegist_day(rs.getString("regist_day"));
				qna.setResult(rs.getString("result"));
				qna.setAnswer(rs.getString("answer"));
				
			}
			
			
		} catch (Exception e) {
			
			System.out.println("getQnaById() method error : " + e);
			
		} finally {
			
			try {
				
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
				
			} catch (Exception e) {
				
				throw new RuntimeException(e.getMessage());
				
			}
			
		}
		
		return qna;
	}

	
}
	
	
	
	
	
	
	
	
	