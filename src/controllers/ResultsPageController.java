package controllers;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.ResponseModel;

public class ResultsPageController extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		String index = request.getParameter("index");
		
		if(action == null || action.isEmpty() || action.equals("search")) {
			if(index != null && !index.isEmpty()) {
				RedirectionController.removeResponse(Integer.parseInt(index));
			}
			
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("SearchPageView.jsp");
			requestDispatcher.forward(request, response);
		}else if(action.equals("results")) {
			
			String term = request.getParameter("term");
			String limit = request.getParameter("limit");
			if(term == null || limit == null || term.isEmpty() || limit.isEmpty()) {
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("SearchPageView.jsp");
				requestDispatcher.forward(request, response);	
			}else {
				int limitInteger = Integer.parseInt(limit);
				ResponseModel rm = new ResponseModel();
				if(!rm.checkParameters(term, limitInteger) || !rm.getSearchResults()) {
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("SearchPageView.jsp");
					requestDispatcher.forward(request, response);
				}else {
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("ResultsPageView.jsp");
					int indexInt = RedirectionController.addResponse(rm);
					request.setAttribute("response", rm);
					request.setAttribute("index", indexInt);
					requestDispatcher.forward(request, response);
				}
			}
			
			
		}
	}

}