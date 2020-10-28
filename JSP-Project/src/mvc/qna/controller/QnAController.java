package mvc.qna.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.qna.model.QnADAO;
import mvc.qna.model.QnADTO;



public class QnAController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	static final int LISTCOUNT = 7;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request,response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		RequestDispatcher rd = null;
		PrintWriter out = response.getWriter();
		out.print("<html><body>"+request.getRequestURL()+"<br>"
								+requestURI+"<br>"
								+contextPath+"<br>"
								+command+"</body></html>");
		
		if(command.equals("/QnAListAction.no")) {
			System.out.println("여기 실행됨1");
			requestQnABoardList(request);
			rd = request.getRequestDispatcher("./qna/qnaList.jsp");
			System.out.println("여기 실행됨2");
		}
		
		else if(command.equals("/QnAWriteFormAction.no")) {
			rd = request.getRequestDispatcher("./qna/addQnA.jsp");
		}
		
		
		 else if(command.equals("/AnswerUpdateViewAction.no")) {
			 System.out.println("asdhweflk");
		 requestAnswerView(request); 
		 rd = request.getRequestDispatcher("/AnswerView.no"); }
		 
		 else if(command.equals("/AnswerView.no")) {
		System.out.println("asdklfhwlkf");
		 rd = request.getRequestDispatcher("./qna/AddAnswer.jsp"); }
		 
		 else if(command.equals("/ReviewUpdateAction.no")) {
			/* requestAnswerUpdate(request); rd = */
		 request.getRequestDispatcher("/ReviewListAction.no"); }
		 
		
		else if(command.equals("/qna/QnAListBack.no")) {
			rd = request.getRequestDispatcher("/QnAListAction.no");
		}
		
		System.out.println("여기 실행됨3");
		rd.forward(request, response);
		
	}



	private void requestAnswerView(HttpServletRequest request) {
		
		QnADAO dao = QnADAO.getInstance();
		
		int num = Integer.parseInt(request.getParameter("num"));
		int qpageNum = Integer.parseInt(request.getParameter("qpageNum"));
		
		QnADTO qna = new QnADTO();
		
		qna = dao.getQnaByNum(num, qpageNum);
		
		request.setAttribute("num", num);
		request.setAttribute("qpageNum", qpageNum);
		request.setAttribute("qna", qna);
		
	}

	private void requestQnABoardList(HttpServletRequest request) {
		
		QnADAO dao = QnADAO.getInstance();
		
		List<QnADTO> qnaBoardList = new ArrayList<QnADTO>();
		
		int qpageNum = 1;
		
		int max = LISTCOUNT;
		
		if(request.getParameter("qpageNum")!=null) qpageNum = Integer.parseInt(request.getParameter("qpageNum"));
		
		int total_list = dao.getQnAListCount();
		
		qnaBoardList = dao.getQnABoardList(qpageNum, max);
		
		int total_qpage;
		
		if(total_list % max == 0) {
			total_qpage = total_list / max;
		}
		else {
			total_qpage = (total_list / max) + 1;
		}
		
		request.setAttribute("qpageNum", qpageNum);
		request.setAttribute("total_qpage", total_qpage);
		request.setAttribute("total_list", total_list);
		request.setAttribute("qnaBoardList", qnaBoardList);
		
	}

	
	
}
