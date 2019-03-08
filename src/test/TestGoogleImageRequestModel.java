package test;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import models.CollageGenerationModel;
import models.GoogleImageRequestModel;

public class TestGoogleImageRequestModel {

	private static GoogleImageRequestModel googleImage;
	private static CollageGenerationModel collage;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		collage = new CollageGenerationModel();
		googleImage = new GoogleImageRequestModel(collage);
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() {
		googleImage.APIImageSearch("pasta");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void invalidSearchTest() {
		googleImage.APIImageSearch(" ");
	}

}
