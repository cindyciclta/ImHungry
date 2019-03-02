package test;

import static org.junit.Assert.*;

import org.junit.BeforeClass;
import org.junit.Test;

import models.EdamamRequestModel;
import models.ResponseModel;

public class TestResponseModel {
	
	private static ResponseModel rm;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		rm = new ResponseModel();
		rm.checkParameters("chicken", 5);
		assertTrue(rm.getSearchResults());
	}

	@Test
	public void testGetSearchTerm() {
		assertEquals("chicken", rm.getSearchTerm());
	}
	
	@Test
	public void testGetCollageString() {
		assertNotNull(rm.getCollageBase64String());
	}
	
	@Test
	public void testGetFormattedDetailedRecipeAt() {
		assertNotNull(rm.getFormattedDetailedRecipeAt(1));
	}
	
	@Test
	public void testGetFormattedDetailedRestaurantAt() {
		assertNotNull(rm.getFormattedDetailedRestaurantAt(1));
	}
	
	@Test
	public void testGetFormattedRecipeResultsAt() {
		assertNotNull(rm.getFormattedRecipeResultsAt(1));
	}
	
	@Test
	public void testGetFormattedRestaurantResultsAt() {
		assertNotNull(rm.getFormattedRestaurantResultsAt(1));
	}
	
	@Test
	public void testGetNumberOfRecipes() {
		assertEquals(5, rm.getNumberOfRecipes());
	}
	
	@Test
	public void testGetNumberOfRestaurants() {
		assertEquals(5, rm.getNumberOfRestaurants());
	}
	
	
	@Test
	public void testInvalidLimit() {
		ResponseModel e = new ResponseModel();
		assertFalse(e.checkParameters("chicken", -5));
	}
	
	@Test
	public void testNullTerm() {
		ResponseModel e = new ResponseModel();
		assertFalse(e.checkParameters(null, 5));
	}
	
	@Test
	public void testEmptyTerm() {
		ResponseModel e = new ResponseModel();
		assertFalse(e.checkParameters(" ", 5));
	}
	
	

}
