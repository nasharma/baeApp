angular.module('BAEApp.services', []).factory('addressService',
		function($http) {

			var addressAPIResponse = {};

			addressAPIResponse.getAddress = function() {
				return $http({
					method : 'GET',
					url : 'addresses'
				});
			}

			return addressAPIResponse;
		});
