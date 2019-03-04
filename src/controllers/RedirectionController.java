package controllers;

import java.io.IOException;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.ResponseModel;

public class RedirectionController extends HttpServlet {
	
	/**
	 * 
	 */
	private static Map<Integer, ResponseModel> responses = new HashMap<>();
	private static int index = 0;
	
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		String index = request.getParameter("index");
		
		if(action == null || action.isEmpty() || index == null || index.isEmpty()) {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("SearchPageView.jsp");
			requestDispatcher.forward(request, response);
			
		}else if(action.equals("managelist")) {
			String list = request.getParameter("list");
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("ManageListView.jsp");
			request.removeAttribute("title");
			if(list.equals("donotshow")) {
				request.setAttribute("title", "Do Not Show");
			}else if(list.equals("favorites")) {
				request.setAttribute("title", "Favorites");
			}else {
				request.setAttribute("title", "To Explore");
			}
			request.setAttribute("response", responses.get(Integer.parseInt(index)));
			request.setAttribute("index", Integer.parseInt(index));
			requestDispatcher.forward(request, response);
			
		}else if(action.equals("recipe")) {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("DetailedRecipeView.jsp");
			int indexInt = Integer.parseInt(index);
			request.setAttribute("index", indexInt);
			String item = request.getParameter("item");
			int itemInt = Integer.parseInt(item);
			request.setAttribute("item", itemInt);
			request.setAttribute("response", responses.get(indexInt).getFormattedDetailedRecipeAt(itemInt));
			requestDispatcher.forward(request, response);
			
		}else if(action.equals("restaurant")) {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("DetailedRestaurantView.jsp");
			int indexInt = Integer.parseInt(index);
			String item = request.getParameter("item");
			int itemInt = Integer.parseInt(item);
			request.setAttribute("index", indexInt);
			request.setAttribute("item", itemInt);
			request.setAttribute("response", responses.get(indexInt).getFormattedDetailedRestaurantAt(itemInt));
			requestDispatcher.forward(request, response);
			
		}else if(action.equals("results")) {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("ResultsPageView.jsp");
			ResponseModel rm = responses.get(Integer.parseInt(index));
			rm.sort();
			request.setAttribute("response", rm);
			int indexInt = Integer.parseInt(index);
			request.setAttribute("index", indexInt);
			requestDispatcher.forward(request, response);
			
		}else if(action.equals("erase")) {
			int indexInt = Integer.parseInt(index);
			RedirectionController.removeResponse(indexInt);
			
		}else if(action.equals("addtolist") || action.equals("movetolist")) {
			
			int indexInt = Integer.parseInt(index);
			String item = request.getParameter("item");
			int itemInt = Integer.parseInt(item);
			
			String list = request.getParameter("list");
			String type = request.getParameter("type");
			
			responses.get(indexInt).addToList(itemInt, list, type, true);
		}else if(action.equals("removefromlist")) {
			int indexInt = Integer.parseInt(index);
			String item = request.getParameter("item");
			int itemInt = Integer.parseInt(item);
			
			String list = request.getParameter("list");
			String type = request.getParameter("type");
			responses.get(indexInt).addToList(itemInt, list, type, false);
		}
	}
	
	public static synchronized int addResponse(ResponseModel rm) {
		responses.put(++index, rm);
		return index;
	}
	
	public static synchronized void removeResponse(int index) {
		responses.remove(index);
	}
	
	
	
}