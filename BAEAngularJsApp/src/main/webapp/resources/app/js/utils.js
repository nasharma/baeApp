angular.module('BAEApp.utils', []).factory(
		'filter',
		function() {

			var filterAddress = {};


			filterAddress.getCountryList = function(addresses) {
				var countryList = [];

				for (var i = 0; i < addresses.length; i++) {
					var isCountryNotAlreadyAdded = countryList
							.indexOf(addresses[i].country) == -1;
					if (isCountryNotAlreadyAdded) {
						countryList.push(addresses[i].country);
					}
				}
				
				return countryList;
			}
			
			filterAddress.getCityList = function(addresses) {
				var cityList = [];

				for (var i = 0; i < addresses.length; i++) {
					var isCityNotAlreadyAdded = cityList
							.indexOf(addresses[i].city) == -1;
					if (isCityNotAlreadyAdded) {
						cityList.push(addresses[i].city);
					}
				}
				
				return cityList;
			}
			
			return filterAddress;
		});
