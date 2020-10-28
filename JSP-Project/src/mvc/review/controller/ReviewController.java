package mvc.review.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.review.model.ReviewDAO;
import mvc.review.model.ReviewDTO;

public class ReviewController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	static final int LISTCOUNT = 8;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request,response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// url로부터 요청정보 얻기
		String reqeustURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = reqeustURI.substring(contextPath.length());
		//문자셋 설정
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		/*PrintWriter out = response.getWriter();
		out.print("<html><body>" + request.getRequestURL() + "<br>"
								 + reqeustURI + "<br>"
								 + contextPath + "<br>"
								 + command + "</body></html>");*/
		
		RequestDispatcher rd = null;
		
		if(command.equals("/ReviewListAction.do")) {
			requestreviewBoardList(request);
			rd = request.getRequestDispatcher("./review/reviewList.jsp");
		}
		
		else if(command.equals("/ReviewWriteFormAction.do")) {
			rd = request.getRequestDispatcher("./review/addReview.jsp");
		}
		
		else if(command.equals("/ProductReviewListAction.do")) {
			requestproductReviewBoardList(request);
			rd = request.getRequestDispatcher("./product/product.jsp");
		}
		
		else if(command.equals("/ReviewWriteAction.do")) {
			//form에서 넘어온 새글 db에 저장하고
			//db에 저장된 리스트를 조회한 후 request에 저장
			// 그리고 다시 /BoardListAction.do 로 보내고 ./board/list.jsp
			rd = request.getRequestDispatcher("/ReviewListAction.do");
		}
		
		else if(command.equals("/ReviewUpdateViewAction.do")) {
			requestReviewView(request);
			rd = request.getRequestDispatcher("/ReviewView.do");
		}
		
		else if(command.equals("/ReviewView.do")) {
			
			rd = request.getRequestDispatcher("./review/updateReview.jsp");
		}
		
		else if(command.equals("/ReviewUpdateAction.do")) {
			requestReviewUpdate(request);
			rd = request.getRequestDispatcher("/ReviewListAction.do");
		}
		
		else if(command.equals("/ReviewDeleteAction.do")) {
			
			requestReviewDelete(request);
			rd = request.getRequestDispatcher("/ReviewListAction.do");
		}
		
		rd.forward(request, response);
		
	}
	
	
	
	


	private void requestReviewDelete(HttpServletRequest request) {

		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		// db에서 삭제 처리
		ReviewDAO dao = ReviewDAO.getInstance();
		System.out.println(num);
		System.out.println(pageNum);
		dao.deleteReview(num);
		
	}


	private void requestReviewView(HttpServletRequest request) {
		
		ReviewDAO dao = ReviewDAO.getInstance();
		
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		ReviewDTO review = new ReviewDTO();
		
		review = dao.getReviewByNum(num, pageNum);
		
		
		// view로 정보를 넘기기위한 설정
		request.setAttribute("num", num);
		request.setAttribute("page", pageNum);
		request.setAttribute("review", review);
		
	}


	// update정보 db에 저장하기
	private void requestReviewUpdate(HttpServletRequest request) {
		
		ReviewDAO dao = ReviewDAO.getInstance();
		//  리스트로 되돌아갈때 원래 페이지로 가기위한 값
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		// db에서 정보얻기
		ReviewDTO review = new ReviewDTO();

		review.setNum(num);
		review.setP_name(request.getParameter("p_name"));
		review.setSubject(request.getParameter("subject"));
		review.setContent(request.getParameter("content"));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String regist_day = sdf.format(new Date());
		
		review.setRegist_day(regist_day);
		review.setStar(request.getParameter("star"));
		
		dao.updateReview(review);
		
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("review", review);
		
	}

	
	// 글 상세페이지 가져오기
	/* private void requestReviewUpdateView() */
	
	// 등록 된 글 목록 가져오기 - 한페이지당 5개 출력
	private void requestreviewBoardList(HttpServletRequest request) {
		// DB와 접속하여 데이터를 가져오는 객체
		ReviewDAO dao = ReviewDAO.getInstance();
		// DB로 부터 가져온 가세글 정보를 담을 리스트 생성
		List<ReviewDTO> reviewBoardList = new ArrayList<ReviewDTO>();
		//출력할 게시글 리스트의 초기화 작업
		int pageNum = 1; // 최초 페이지는 1page로 설정해주기 위해 pageNum의 초기화값 1
		
		int limit = LISTCOUNT; // 한 페이지에 보일수있는 최대 리뷰의 갯수 상수 지정해준 LISTCOUNT값으로 limit지정
		// 페이지리스트에서 해당 페이지 번호를 클릭했을때 해당 페이지가 넘어옴
		if(request.getParameter("pageNum")!=null) pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		// 검색조건을 받는 변수 선언
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		
		// 조회 된 전체 글 수
		int total_record = dao.getreviewListCount(items, text);
		// 페이지번호, 최대 리뷰수, 검색 조건, 검색 내용
		reviewBoardList = dao.getreviewBoardList(pageNum, limit, items, text);
		// 조회 된 전체 글 페이지수
		int total_page;
		
		// 페에지의 갯수를 정하는 로직
		if(total_record % limit == 0) {
			total_page = total_record / limit;
		}
		else {
			total_page = (total_record / limit) + 1;
		}
		
		System.out.println("items : " + items);
		System.out.println("text : " + text);
		System.out.println("total_record:" + total_record);
		// 결과를 view에 전달하기 위해 request에 저장
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_page", total_page);
		request.setAttribute("total_record", total_record);
		request.setAttribute("reviewBoardList", reviewBoardList);
		request.setAttribute("items", items);
		request.setAttribute("text", text);
		
	}
	
	@SuppressWarnings("unused")
	private void requestproductReviewBoardList(HttpServletRequest request) {
		
		ReviewDAO pdao = ReviewDAO.getInstance();
		
		List<ReviewDTO> productreviewBoardList = new ArrayList<ReviewDTO>();
		
		int pPageNum = 1;
		int limit = LISTCOUNT;
		
		if(request.getParameter("pPageNum")!=null) pPageNum = Integer.parseInt(request.getParameter("pPageNum"));
		
		String p_name = request.getParameter("p_name");
		
		int product_total_record = pdao.getProductreviewListCount(p_name);
		productreviewBoardList = pdao.getProductreviewBoardList(pPageNum, limit, p_name);
		int product_total_page;
		
		if(product_total_record % limit == 0) product_total_page = product_total_record / limit;
		else product_total_page = (product_total_record / limit) + 1;
		
		System.out.println("p_name : " + p_name);
		System.out.println("product_total_record:" + product_total_record);
		System.out.println("product_total_page:" + product_total_page);
		
		request.setAttribute("pPageNum", pPageNum);
		request.setAttribute("product_total_page", product_total_page);
		request.setAttribute("product_total_record", product_total_record);
		request.setAttribute("productreviewBoardList", productreviewBoardList);
		request.setAttribute("p_name", p_name);
	}
	
}
