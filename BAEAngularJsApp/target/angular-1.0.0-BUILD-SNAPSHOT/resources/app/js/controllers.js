angular.module('BAEApp.controllers', []).controller('addressController',
		function($scope, addressService, filter) {
			$scope.active = 'home';

			addressService.getAddress().success(function(response) {
				$scope.addresses = response;
				$scope.countryList = filter.getCountryList(response);
				$scope.addressByCountry = filter.groupByCountry(response);
				$scope.cityList = filter.getCityList(response);
				$scope.addressByCity = filter.groupByCity(response);
				$scope.selectedAddress = JSON.stringify(response[0]);
				$scope.selectedAddressObj = response[0];
			});

			var defaultAddress = {
				"address" : "Wisma Academy 4A, Jalan 19/1",
				"city" : "Petaling Jaya",
				"country" : "Malaysia",
				"postalCode" : "46300",
				"lng" : 101.6278914,
				"lat" : 3.1120654
			};
			
			
			$scope.map = {
				center : {
					latitude : defaultAddress.lat,
					longitude : defaultAddress.lng
				},
				zoom : 20,
				markers : [ {
					id : 1,
					latitude : defaultAddress.lat,
					longitude : defaultAddress.lng,
					showWindow : false,
					closeClick : true,
					options : {
						animation : 1,
						labelAnchor : "22 0",
						labelClass : "marker-labels"
					}
				} ]
			};

			$scope.changeAddress = function() {

				var selectedAddress = JSON.parse($scope.selectedAddress);
				$scope.map.center = {
					latitude : selectedAddress.lat,
					longitude : selectedAddress.lng
				};
				$scope.map.markers = [ {
					id : 1,
					latitude : selectedAddress.lat,
					longitude : selectedAddress.lng,
					showWindow : false,
					closeClick : true,
					options : {
						animation : 1,
						labelAnchor : "22 0",
						labelClass : "marker-labels"
					}
				} ];
				$scope.selectedAddressObj = selectedAddress;

			};

		});
