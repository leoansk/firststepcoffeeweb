package com.ansk.web.service;

import org.springframework.stereotype.Service;

//AOP연습
@Service
public class SampleServiceImpl implements SampleService{

	@Override
	public Integer doAdd(String str1, String str2) throws Exception {
		System.out.println("sampleServiceImple 내부");
		return Integer.parseInt(str1) + Integer.parseInt(str2);
	}
	
}
