package mvc.review.model;

import java.util.ArrayList;
import java.util.List;

import mvc.review.database.DBCon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ReviewDAO {
	// 자신 타입의 필드 선언
	private static ReviewDAO instance = new ReviewDAO();
	// default 생성자 캡슐화
	private ReviewDAO() {}
	// 자신타입의 인스턴스 제공 메소드
	public static ReviewDAO getInstance() {
		return instance;
	}
	// 조회 된 reviewBoard 테이블의 레코드 건수
	public int getreviewListCount(String items, String text) {
		// DB접속객체 생성
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
		String sql;
		
		// 매개변수로 넘어온 검색 조건과 검색 내용을 분석하여 쿼리 작성
		if(items == null || text.trim().length()==0) sql = "select count(*) from reviewBoard";
		
		else sql = "select count(*) from reviewBoard where " + items + " like '%" + text + "%'";
		
		try {
			
			//DB연결하기
			con = DBCon.getInstance().getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) x = rs.getInt(1);
			
		} catch (Exception e) {

			System.out.println("getReviewListCount() method error : " + e);
			
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
	
	// 조회 목록 리턴 메소드
	public List<ReviewDTO> getreviewBoardList(int pageNum, int limit, String items, String text){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		// 글 전체 건수 가져오기
		int total_record = getreviewListCount(items, text);
		// 시작페이지의 글번호
		int start = (pageNum-1) * limit;
		
		int index = start + 1;
		
		if(items == null || text.trim().length()==0) sql = "select * from reviewBoard order by num desc";
		else sql = "select * from reviewBoard where " + items + " like '%" + text + "%' order by num desc";
		
		ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();
		
		try {
			
			con = DBCon.getInstance().getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.absolute(index)) {
				
				ReviewDTO review = new ReviewDTO();
				// review 빈에 결과 저장
				review.setNum(rs.getInt("num"));
				review.setP_Id(rs.getString("p_id"));
				review.setP_name(rs.getString("p_name"));
				review.setSubject(rs.getString("subject"));
				review.setContent(rs.getString("content"));
				review.setRegist_day(rs.getString("regist_day"));
				review.setHit(rs.getInt("hit"));
				review.setP_fileName(rs.getString("p_fileName"));
				review.setStar(rs.getString("star"));
				
				// 각 칼럼 속성들 리스트에 추가
				list.add(review);
				// 한 페이지 글 제한 갯수(5) 이내면 증가
				if(index < (start+limit) && index <= total_record) index ++;
				else break;
				
			}
			
		} catch (Exception e) {
			
			System.out.println("getReviewList() method error : " + e);
		
		} finally {
			
			try {
				
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
				
			} catch (Exception e) {
				
				throw new RuntimeException(e.getMessage());
				
			}
			
		}
		return list;
		
	}
	
	public int getProductreviewListCount(String p_name) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
		
		String sql = "select count(*) from reviewBoard where p_name = '" + p_name + "'";
		
		try {
			
			//DB연결
			con = DBCon.getInstance().getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) x = rs.getInt(1);
			
		} catch (Exception e) {
			
			System.out.println("getProductreviewListCount : " + e);
			
		} finally {
			
			try {
				
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
				
			} catch (Exception e) {
				
				throw new RuntimeException(e.getMessage());
				
			} 
			
		}
		
		return x;
		
	}
	
	public List<ReviewDTO> getProductreviewBoardList(int pPageNum, int limit, String p_name){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from reviewBoard where p_name = '" + p_name + "'";
		
		int product_total_record = getProductreviewListCount(p_name);
		
		int start = (pPageNum-1) * limit;
		
		int index = start + 1;
		
		ArrayList<ReviewDTO> productList = new ArrayList<ReviewDTO>();
		
		try {
			
			con = DBCon.getInstance().getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.absolute(index)) {
				
				ReviewDTO productReview = new ReviewDTO();
				// productReview빈에 결과 저장
				productReview.setNum(rs.getInt("num"));
				productReview.setP_Id(rs.getString("p_id"));
				productReview.setP_name(rs.getString("p_name"));
				productReview.setSubject(rs.getString("subject"));
				productReview.setContent(rs.getString("content"));
				productReview.setRegist_day(rs.getString("regist_day"));
				productReview.setHit(rs.getInt("hit"));
				productReview.setP_fileName(rs.getString("p_fileName"));
				productReview.setStar(rs.getString("star"));
				
				//각 칼럼 속성들 리스트에 추가
				productList.add(productReview);
				// 한 페이지 글자 제한 갯수(5) 이내면 증가
				if(index < (start + limit) && index <= product_total_record) index ++;
				else break;
				
			}
			
		} catch (Exception e) {
			
			System.out.println("getProductreviewBoardList() method error : " + e);
			
		} finally {
			
			try {
				
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
				
			} catch (Exception e) {
				
				throw new RuntimeException(e.getMessage());
				
			}
			
		}
		
		return productList;
		
	}
	// Update하려는 review정보 리턴
	public ReviewDTO getReviewByNum(int num, int pageNum) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ReviewDTO review = null;
		
		try {
			
			con = DBCon.getInstance().getConnection();
			String sql = "select * from reviewBoard where num=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				review = new ReviewDTO();
				review.setNum(rs.getInt("num"));
				review.setP_Id(rs.getString("p_id"));
				review.setP_name(rs.getString("p_name"));
				review.setSubject(rs.getString("subject"));
				review.setContent(rs.getString("content"));
				review.setRegist_day(rs.getString("regist_day"));
				review.setHit(rs.getInt("hit"));
				review.setP_fileName(rs.getString("p_fileName"));
				review.setStar(rs.getString("star"));
				
			}
			
		} catch (Exception e) {
			
			System.out.println("getReviewById() method error : " + e);
			
		} finally {
			
			try {
				
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
				
			} catch (Exception e) {
				
				throw new RuntimeException(e.getMessage());
				
			}
			
		}
		
		return review;
	}


	//review update 메소드
	public void updateReview(ReviewDTO review) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = DBCon.getInstance().getConnection();
			String sql = "update reviewBoard set subject=?,content=?,regist_day=?,star=? where num=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, review.getSubject());
			pstmt.setString(2, review.getContent());
			pstmt.setString(3, review.getRegist_day());
			pstmt.setString(4, review.getStar());
			pstmt.setInt(5, review.getNum());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			
			System.out.println("UpdateBoard() method error : " + e);
			
		}
		finally {
			
			try {
	
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
				
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
			
		}
		
	}
	
	public void deleteReview(int num) {
		
		/*
		 * System.out.println("다오 실행됨");
		 * 
		 * Connection con = null; PreparedStatement pstmt = null; try {
		 * 
		 * con = DBCon.getInstance().getConnection(); String sql =
		 * "delete from reviewBoard where num=?"; pstmt = con.prepareStatement(sql);
		 * 
		 * pstmt.setInt(1, num.getNum());
		 * 
		 * pstmt.executeUpdate(); System.out.println("쿼리문도 실행됨"); } catch (Exception e)
		 * {
		 * 
		 * System.out.println("DeleteBoard() method error : " + e);
		 * 
		 * } finally {
		 * 
		 * try {
		 * 
		 * if(pstmt!=null) pstmt.close(); if(con!=null) con.close();
		 * 
		 * } catch (Exception e) { throw new RuntimeException(e.getMessage()); }
		 * 
		 * } System.out.println("컨트롤러 실행됨");
		 */
		
		// db연결객체 생성
				Connection con = null;
				PreparedStatement pstmt = null;
				// ResultSet 필요없음
				
				try {
					
					con = DBCon.getInstance().getConnection();
					String sql = "delete from reviewBoard where num = ?";
					pstmt = con.prepareStatement(sql);
					System.out.println("딜리트 실행됨");
					pstmt.setInt(1, num);
					
					pstmt.executeUpdate();
					
				} catch (Exception e) {
					
					System.out.println("deleteReview() method error : " + e);
					
				} finally {
					
					try {
						
						if(pstmt!=null) pstmt.close();
						if(con!=null) con.close();
						
					} catch (Exception e) {

						throw new RuntimeException(e.getMessage());
						
					}
					
				}
		
	}
	
}