describe('addressService', function() {
	
	 beforeEach(module('BAEApp.services'));
	  
	 beforeEach(inject(function($injector) {
		     
		     $httpBackend = $injector.get('$httpBackend');
		   
		     addressRequestHandler = $httpBackend.when('GET', 'addresses')
		                            .respond( [{"country":"Malaysia"},{"country":"Singapore"}]);

		   }));

		   afterEach(function() {
		     $httpBackend.verifyNoOutstandingExpectation();
		     $httpBackend.verifyNoOutstandingRequest();
		   });
	  
		  it('addressSerice should be defined', inject(function(addressService) {
			    expect(addressService).toBeDefined();
		  }));
	 
	  
	 describe('getAddress', function() {
		  
		  
		  it('check getAddress API call', inject(function(addressService) {
			  addressService.getAddress().then(function (response){
				  expect(response.data.length).toEqual(2);
				  expect(response.data).toContain({"country":"Malaysia"});
				  expect(response.data).toContain({"country":"Singapore"});
			  });
			 $httpBackend.flush();
		    }));
		  
	  });
	
});