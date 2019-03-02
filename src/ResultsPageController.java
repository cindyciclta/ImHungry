import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.ResponseModel;

@WebServlet("/ResultsPageController")
public class ResultsPageController extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		
		if(action == null || action.isEmpty() || action.equals("search")) {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("SearchPageView.jsp");
			requestDispatcher.forward(request, response);
		}else if(action.equals("results")) {
			
			String term = request.getParameter("term");
			String limit = request.getParameter("limit");
			int limitInteger = Integer.parseInt(limit);
			if(term == null || limit == null || term.isEmpty() || limit.isEmpty()) {
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("SearchPageView.jsp");
				requestDispatcher.forward(request, response);	
			}else {
				ResponseModel rm = new ResponseModel();
				if(!rm.checkParameters(term, limitInteger) || !rm.getSearchResults()) {
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("SearchPageView.jsp");
					requestDispatcher.forward(request, response);
				}else {
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("ResultsPageView.jsp");
					int index = RedirectionController.addResponse(rm);
					request.setAttribute("response", rm);
					request.setAttribute("index", index);
					requestDispatcher.forward(request, response);
				}
			}
			
			
		}
	}

}