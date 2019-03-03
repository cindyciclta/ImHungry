package test;

import static org.junit.Assert.*;

import org.junit.BeforeClass;
import org.junit.Test;

import models.YelpRequestModel;
import models.ResponseCodeModel;

public class TestYelpRequestModel {

private static YelpRequestModel cached;
	
	@BeforeClass
	public static void setUp() {
		cached = new YelpRequestModel();
		assertTrue(cached.checkParameters("coffee", 5));
		assertEquals(ResponseCodeModel.OK, cached.completeTask());
	}
	
	@Test
	public void testInvalidLimit() {
		YelpRequestModel e = new YelpRequestModel();
		assertFalse(e.checkParameters("coffee", -5));
	}
	
	@Test
	public void testNullTerm() {
		YelpRequestModel e = new YelpRequestModel();
		assertFalse(e.checkParameters(null, 5));
	}
	
	@Test
	public void testEmptyTerm() {
		YelpRequestModel e = new YelpRequestModel();
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
