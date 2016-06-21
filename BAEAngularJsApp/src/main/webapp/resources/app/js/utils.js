angular.module('BAEApp.utils', []).factory(
		'filter',
		function() {

			var filterAddress = {};

			filterAddress.groupByCountry = function(address) {
				return address;
			}

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

			return filterAddress;
		});
