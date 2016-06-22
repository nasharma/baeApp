describe('filter', function() {
	
	 beforeEach(module('BAEApp.utils'));
	 
	  it('filter to be defined', inject(function(filter) {
		    expect(filter).toBeDefined();
	  }));
	  
	  describe('getCountryList', function() {
		  
		  it('check getCountryList for sample data', inject(function(filter) {
		      var sampleDate = [{"country":"Malaysia"},{"country":"Singapore"}];
		      var listOfCountries = filter.getCountryList(sampleDate);
		      expect(listOfCountries).toContain("Malaysia");
		      expect(listOfCountries).toContain("Singapore");
		    }));
		  
	  });
	  
	  describe('getCityList', function() {
		  
		  it('check getCityList for sample data', inject(function(filter) {
		      var sampleDate = [{"city":"Kuala Lumpur"},{"city":"Petaling Jaya"}];
		      var listOfCities = filter.getCityList(sampleDate);
		      expect(listOfCities).toContain("Kuala Lumpur");
		      expect(listOfCities).toContain("Petaling Jaya");
		    }));
		  
	  });
	
});