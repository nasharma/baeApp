package com.bae.angular.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class JasmineController {

	@RequestMapping(value = "/SpecRunner", method = RequestMethod.GET)
	public String specRunner(){
		return "SpecRunner";
	}
}
