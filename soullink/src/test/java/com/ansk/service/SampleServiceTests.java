package com.ansk.service;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ansk.web.service.SampleService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/resources/spring/**/root-context.xml" })

public class SampleServiceTests{
	private static final Logger logger = LoggerFactory.getLogger(SampleServiceTests.class);
	
	@Inject
	private SampleService service;
	
	@Test
	public void testClass() {
		logger.info("test class");
		logger.info(service.toString());
		logger.info(service.getClass().getName());
	}
	
	@Test
	public void doAdd() throws Exception{
		logger.info("Test중 service.doAdd()메소드 실행");
		logger.info(service.doAdd("111", "222").toString());
	}
}