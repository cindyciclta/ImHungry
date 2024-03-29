package test;

import controllers.SearchPageController;
import static org.junit.Assert.*;
import static org.mockito.Mockito.*;
import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class TestSearchPageController extends Mockito{
	
	@Mock
    HttpServletRequest request;

    @Mock
    HttpServletResponse response;

    @Mock
    RequestDispatcher rd;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}
	
	@Before
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
    }

	@Test
    public void testInvalidAction() throws Exception {
        when(request.getParameter("action")).thenReturn( null );
        when(request.getRequestDispatcher("SearchPageView.jsp")).thenReturn(rd);
        new SearchPageController().service(request, response);
        verify(rd).forward(request, response);
    }
	
	@Test
    public void testInvalidActionEmpty() throws Exception {
        when(request.getParameter("action")).thenReturn( "" );
        when(request.getRequestDispatcher("SearchPageView.jsp")).thenReturn(rd);
        new SearchPageController().service(request, response);
        verify(rd).forward(request, response);
    }
	
	@Test
    public void testActionRedirect() throws Exception {
        when(request.getParameter("action")).thenReturn( "redirect" );
        when(request.getRequestDispatcher("SearchPageView.jsp")).thenReturn(rd);
        new SearchPageController().service(request, response);
        verify(rd).forward(request, response);
    }
	
	@Test
    public void testSearchInvalid() throws Exception {
        when(request.getParameter("action")).thenReturn( "search" );
        when(request.getParameter("term")).thenReturn( null );
        when(request.getParameter("limit")).thenReturn( "5" );
        when(request.getRequestDispatcher("SearchPageView.jsp")).thenReturn(rd);
        new SearchPageController().service(request, response);
        verify(rd).forward(request, response);
    }
	
	@Test
    public void testSearchInvalidEmpty() throws Exception {
        when(request.getParameter("action")).thenReturn( "search" );
        when(request.getParameter("term")).thenReturn( "" );
        when(request.getParameter("limit")).thenReturn( "5" );
        when(request.getRequestDispatcher("SearchPageView.jsp")).thenReturn(rd);
        new SearchPageController().service(request, response);
        verify(rd).forward(request, response);
    }
	
	@Test
    public void testSearchInvalidLimit() throws Exception {
        when(request.getParameter("action")).thenReturn( "search" );
        when(request.getParameter("term")).thenReturn( "chicken" );
        when(request.getParameter("limit")).thenReturn( null );
        when(request.getRequestDispatcher("SearchPageView.jsp")).thenReturn(rd);
        new SearchPageController().service(request, response);
        verify(rd).forward(request, response);
    }
	
	@Test
    public void testSearchInvalidLimitEmpty() throws Exception {
        when(request.getParameter("action")).thenReturn( "search" );
        when(request.getParameter("term")).thenReturn( "chicken" );
        when(request.getParameter("limit")).thenReturn( "" );
        when(request.getRequestDispatcher("SearchPageView.jsp")).thenReturn(rd);
        new SearchPageController().service(request, response);
        verify(rd).forward(request, response);
    }
	
	@Test
    public void testSearchValid() throws Exception {
        when(request.getParameter("action")).thenReturn( "search" );
        when(request.getParameter("term")).thenReturn( "chicken" );
        when(request.getParameter("limit")).thenReturn( "5" );
        when(request.getRequestDispatcher("ResultsPageController?action=results&term=chicken&limit=5")).thenReturn(rd);
        new SearchPageController().service(request, response);
        verify(rd).forward(request, response);
    }
	
	
	

}
