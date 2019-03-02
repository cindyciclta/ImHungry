import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SearchPageController")
public class SearchPageController extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		
		// Search action
		if(action == null || action.isEmpty() || action.equals("redirect")) {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("SearchPageView.jsp");
			requestDispatcher.forward(request, response);
		}else if(action.equals("search")) {
			// Results action
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("ResultsPageController");
			requestDispatcher.forward(request, response);
		}
		
		
		
		
	}

}