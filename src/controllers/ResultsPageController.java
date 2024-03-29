package controllers;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import models.CollageGenerationModel;
import models.GoogleImageRequestModel;
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
				CollageGenerationModel collagemodel = new CollageGenerationModel();
				GoogleImageRequestModel googleimagemodel = new GoogleImageRequestModel(collagemodel);
				System.out.println("not encioded yet "+ term);
				googleimagemodel.APIImageSearch(term);
				
				if(!rm.checkParameters(term, limitInteger) || !rm.getSearchResults()) {
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("SearchPageView.jsp");
					requestDispatcher.forward(request, response);
				}else {
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("ResultsPageView.jsp");
					int indexInt = RedirectionController.addResponse(rm);
					
					ArrayList<String> urllist = (ArrayList<String>) collagemodel.getList();
					JSONArray jsArray = new JSONArray (urllist);


					request.setAttribute("response", rm);
					request.setAttribute("index", indexInt);
					request.setAttribute("term", term);
					request.setAttribute("length", urllist.size());
					request.setAttribute("jsonarray", jsArray);
					requestDispatcher.forward(request, response);
				}
			}
			
			
		}
	}

}