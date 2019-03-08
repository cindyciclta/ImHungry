package test;

import static org.junit.Assert.*;

import java.io.IOException;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;

import models.CollageGenerationModel;
import models.GoogleImageRequestModel;
import models.ResponseCodeModel;

public class TestGoogleImageRequestModel extends Mockito{

	private static GoogleImageRequestModel googleImage;
	private static CollageGenerationModel collage;
	
	@Mock
	GoogleImageRequestModel googleMock;
	
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
		MockitoAnnotations.initMocks(this);
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void invalidSearchTest() {
		googleImage.APIImageSearch(" ");
	}
	
	@Test
	public void testBadResponse() throws Exception{
		when(googleMock.getResponse("pasta")).thenThrow(new IOException());
		assertEquals(null, googleMock.APIImageSearch("pasta"));
	}
	
	@Test
	public void testEmptyResponse() throws Exception{
		when(googleMock.getResponse("pasta")).thenReturn("");
		assertEquals(null, googleMock.APIImageSearch("pasta"));
	}

}
