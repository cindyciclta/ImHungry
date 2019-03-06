package test;

import static org.junit.Assert.*;

import java.io.IOException;

import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;

import models.EdamamRequestModel;
import models.ResponseCodeModel;

public class TestEdamamRequestModel extends Mockito{
	
	private static EdamamRequestModel cached;
	
	@Mock
	private EdamamRequestModel ed;
	
	@Before
    public void setUpMock() throws Exception {
        MockitoAnnotations.initMocks(this);
    }
	
	@BeforeClass
	public static void setUp() {
		cached = new EdamamRequestModel();
		assertTrue(cached.checkParameters("coffee", 5));
		assertEquals(ResponseCodeModel.OK, cached.completeTask());
	}
	
	@Test
	public void testInvalidLimit() {
		EdamamRequestModel e = new EdamamRequestModel();
		assertFalse(e.checkParameters("chicken", -5));
	}
	
	@Test
	public void testNullTerm() {
		EdamamRequestModel e = new EdamamRequestModel();
		assertFalse(e.checkParameters(null, 5));
	}
	
	@Test
	public void testEmptyTerm() {
		EdamamRequestModel e = new EdamamRequestModel();
		assertFalse(e.checkParameters(" ", 5));
	}
	
	@Test
	public void testResultsSize() {
		assertEquals(5, cached.getResultsSize());
		
	}
	
	@Test
	public void testGetFormattedResultsNegative() {
		assertNull(cached.getFormattedResultsFieldsAt(-1));
	}
	
	@Test
	public void testGetFormattedResultsOob() {
		assertNull(cached.getFormattedResultsFieldsAt(5));
	}
	
	@Test
	public void testGetFormattedResults() {
		assertNotNull(cached.getFormattedResultsFieldsAt(1));
	}
	
	@Test
	public void testGetFormattedDetailsNegative() {
		assertNull(cached.getFormattedDetailsFieldsAt(-1));
	}
	
	@Test
	public void testGetFormattedDetailssOob() {
		assertNull(cached.getFormattedDetailsFieldsAt(5));
	}
	
	@Test
	public void testGetFormattedDetails() {
		assertNotNull(cached.getFormattedDetailsFieldsAt(1));
	}
	
	@Test
	public void testNotNullResults() {
		assertNotNull(cached.getResults());
	}

}
