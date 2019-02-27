package test;

import static org.junit.Assert.*;

import org.junit.Test;

import models.IngredientModel;

public class TestIngredientModel {
	

	@Test
	public void testIngrdientModelNullName() {
		IngredientModel i = new IngredientModel();
		assertFalse(i.validateIngredients(null, 10, "ounces"));
	}
	
	@Test
	public void testIngredientModelEmptyName() {
		IngredientModel i = new IngredientModel();
		assertFalse(i.validateIngredients("", 10, "ounces"));
	}
	
	@Test
	public void testIngredientModelEmptyUnits() {
		IngredientModel i = new IngredientModel();
		assertFalse(i.validateIngredients("oil", 10, ""));
	}
	
	@Test
	public void testIngredientModelNullUnits() {
		IngredientModel i = new IngredientModel();
		assertFalse(i.validateIngredients("oil", 10, null));
	}
	
	@Test
	public void testIngredientModelInvalidAmount() {
		IngredientModel i = new IngredientModel();
		assertFalse(i.validateIngredients("oil", -1, "ounces"));
	}
	
	@Test
	public void testIngredientModelValidFormat() {
		IngredientModel i = new IngredientModel();
		assertTrue(i.validateIngredients("oil", 10.5, "fluid ounces"));
		assertEquals(i.formatIngredients(), "10.5 fluid ounces of oil");
	}

}
