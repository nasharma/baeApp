package com.bae.angular;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AddressController {
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/addresses", method = RequestMethod.GET)
	public @ResponseBody String getAddresses() {
		logger.debug("Service is called!");
		return "[{\"address\":\"Wisma Academy4A, Jalan 19/1\",\"city\":\"Petaling Jaya\",\"country\":\"Malaysia\",\"postalCode\":\"46300\", \"lng\":101.6278914, \"lat\":3.1120654},{\"address\":\"The BoulevardMid Valley City, Lingkaran Syed Putra\",\"city\":\"Kuala Lumpur\",\"country\":\"Malaysia\",\"postalCode\":\"59200\",\"lng\":101.667495,\"lat\":3.100753},{\"address\":\"Vertical Business Suite II, Avenue 3, Bangsar South, No.8, Jalan Kerinchi,\",\"city\":\"Kuala Lumpur\",\"country\":\"Malaysia\",\"postalCode\":\"59200\", \"lng\": 101.6634711, \"lat\": 3.1105239},{\"address\":\"Oval Damansara,No.685, Jalan Damansara,Sprint Highway,\",\"city\":\"Kuala Lumpur\",\"country\":\"Malaysia\",\"postalCode\":\"60000\", \"lng\": 101.6289193, \"lat\": 3.1320123},{\"address\":\"Jalan Pandan Cahaya 1/2Pandan CahayaSelangor Darul Ehsan\",\"city\":\"Ampang\",\"country\":\"Malaysia\",\"postalCode\":\"68000\", \"lng\": 101.7549664, \"lat\": 3.1384067},{\"address\":\"Aljunied Rd, Cititech Industrial Building,\",\"city\":\"Singapore\",\"country\":\"Singapore\",\"postalCode\":\"389838\",\"lng\":103.879393,\"lat\":1.325676}, {\"address\":\"CTI Tower, 191/11-12 Ratchadaphisek RoadKhwaeng Klongtoey, Khet Klongtoey,\",\"city\":\"Bangkok\",\"country\":\"Thailand\",\"postalCode\":\"10110\",\"lng\":100.583109,\"lat\":13.708034},{\"address\":\"HITTC building, 185 Gang Vo, Dong Da, Hanoi\",\"city\":\"Hanoi\",\"country\":\"Viet Nam\", \"lng\": 105.7810633, \"lat\": 21.0361061}, {\"address\":\"Van Bao str., Ba Dinh dist.,\",\"city\":\"Hanoi\",\"country\":\"Viet Nam\", \"lng\": 105.8148791, \"lat\": 21.0321657}]";
	}
	
}
