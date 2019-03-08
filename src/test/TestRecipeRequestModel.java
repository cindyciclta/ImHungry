package test;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import models.MockRecipeRequestModel;
import models.ResponseCodeModel;

public class TestRecipeRequestModel{
	private static MockRecipeRequestModel cached;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		//MockitoAnnotations.initMocks(this);
		cached = new MockRecipeRequestModel();
		assertTrue(cached.edamam.checkParameters("coffee", 5));
		assertEquals(ResponseCodeModel.OK, cached.completeTask("coffee", 5));
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testInvalidLimit() {
		assertFalse(cached.edamam.checkParameters("chicken", -5));
	}
	
	@Test
	public void testNullTerm() {
		assertFalse(cached.edamam.checkParameters(null, 5));
	}
	
	@Test
	public void testEmptyTerm() {
		assertFalse(cached.edamam.checkParameters(" ", 5));
	}
	
	@Test
	public void testResultsSize() {
		assertEquals(5, cached.edamam.getResultsSize());
	}
	
	@Test
	public void testGetFormattedResultsNegative() {
		assertNull(cached.edamam.getFormattedResultsFieldsAt(-1));
	}
	
	@Test
	public void testGetFormattedResultsOob() {
		assertNull(cached.edamam.getFormattedResultsFieldsAt(5));
	}
	
	@Test
	public void testGetFormattedResults() {
		assertNotNull(cached.edamam.getFormattedResultsFieldsAt(1));
	}
	
	@Test
	public void testGetFormattedDetailsNegative() {
		assertNull(cached.edamam.getFormattedDetailsFieldsAt(-1));
	}
	
	@Test
	public void testGetFormattedDetailssOob() {
		assertNull(cached.edamam.getFormattedDetailsFieldsAt(5));
	}
	
	@Test
	public void testGetFormattedDetails() {
		assertNotNull(cached.edamam.getFormattedDetailsFieldsAt(1));
	}
	
	@Test
	public void testNotNullResults() {
		assertNotNull(cached.edamam.getResults());
	}

}
