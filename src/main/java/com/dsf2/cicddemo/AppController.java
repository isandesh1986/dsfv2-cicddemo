package com.dsf2.cicddemo;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController

public class AppController {
	
	@RequestMapping("/")
	public String hello() {
		return "<h3>Hello from DSF V2 CICD Demo on Jenkins on nKaas</h3>";
	}
}
