package com.bae.angular;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AddressController {
	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	private static final String ADDRESS_DATA = "classpath:data/address.json";
	
	@Autowired
	ResourceLoader resourceLoader;

	@RequestMapping(value = "/addresses", method = RequestMethod.GET)
	public @ResponseBody String getAddresses() throws IOException {

		logger.debug("Address Controller is called!");
		Resource resource = resourceLoader.getResource(ADDRESS_DATA);
		BufferedReader bf = new BufferedReader(new InputStreamReader(resource.getInputStream()));
		String nextLine = null;
		StringBuilder str = new StringBuilder("");
		while((nextLine = bf.readLine()) != null){
			str.append(nextLine);
		}
		logger.debug("Response sent is: "+str.toString());
	return str.toString();
	}

}
