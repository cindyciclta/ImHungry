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

@WebServlet("/RedirectionController")
public class RedirectionController extends HttpServlet {
	
	/**
	 * 
	 */
	private static Map<Integer, ResponseModel> responses = new HashMap<>();
	private static int index = 0;
	
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	public static synchronized int addResponse(ResponseModel rm) {
		responses.put(++index, rm);
		return index;
	}
	
	
	
}