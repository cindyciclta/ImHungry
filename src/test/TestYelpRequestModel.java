package test;

import static org.junit.Assert.*;

import org.junit.BeforeClass;
import org.junit.Test;

import models.YelpRequestModel;
import models.MockYelpRequestModel;
import models.ResponseCodeModel;

public class TestYelpRequestModel {

private static MockYelpRequestModel cached;
	
	@BeforeClass
	public static void setUp() {
		cached = new MockYelpRequestModel();
		assertTrue(cached.yelp.checkParameters("coffee", 5));
		assertEquals(ResponseCodeModel.OK, cached.completeTask("coffee",5));
	}
	
	@Test
	public void testInvalidLimit() {
		//YelpRequestModel e = new YelpRequestModel();
		assertFalse(cached.yelp.checkParameters("coffee", -5));
	}
	
	@Test
	public void testNullTerm() {
		//YelpRequestModel e = new YelpRequestModel();
		assertFalse(cached.yelp.checkParameters(null, 5));
	}
	
	@Test
	public void testEmptyTerm() {
		//YelpRequestModel e = new YelpRequestModel();
		assertFalse(cached.yelp.checkParameters(" ", 5));
	}
	
	@Test
	public void testResultsSize() {
		assertEquals(5, cached.yelp.getResultsSize());
		
	}
	
	@Test
	public void testGetFormattedResultsNegative() {
		assertNull(cached.yelp.getFormattedResultsFieldsAt(-1));
	}
	
	@Test
	public void testGetFormattedResultsOob() {
		assertNull(cached.yelp.getFormattedResultsFieldsAt(5));
	}
	
	@Test
	public void testGetFormattedResults() {
		assertNotNull(cached.yelp.getFormattedResultsFieldsAt(1));
	}
	
	@Test
	public void testGetFormattedDetailsNegative() {
		assertNull(cached.yelp.getFormattedDetailsFieldsAt(-1));
	}
	
	@Test
	public void testGetFormattedDetailssOob() {
		assertNull(cached.yelp.getFormattedDetailsFieldsAt(5));
	}
	
	@Test
	public void testGetFormattedDetails() {
		assertNotNull(cached.yelp.getFormattedDetailsFieldsAt(1));
	}
	
	@Test
	public void testNotNullResults() {
		assertNotNull(cached.yelp.getResults());
	}

}
