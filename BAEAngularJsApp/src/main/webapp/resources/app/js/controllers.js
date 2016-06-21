angular.module('BAEApp.controllers', []).controller('addressController',
		function($scope, addressService , filter) {
			$scope.active = 'home';
			$scope.map = {
				center : {
					latitude : 3.1120654,
					longitude : 101.6278914
				},
				zoom : 8/*,
				 markers: [],
		            events: {
		            click: function (map, eventName, originalEventArgs) {
		                var e = originalEventArgs[0];
		                var lat = e.latLng.lat(),lon = e.latLng.lng();
		                var marker = {
		                    id: Date.now(),
		                    coords: {
		                        latitude: lat,
		                        longitude: lon
		                    }
		                };
		                $scope.map.markers.push(marker);
		                alert($scope.map.markers);
		                $scope.$apply();
		            }
		        }*/
			};
			$scope.changeAddress = function(){
				var selectedAddress = JSON.parse($scope.selectedAddress);
				$scope.map.center = { latitude: selectedAddress.lat, longitude: selectedAddress.lng };
				$scope.selectedAddressObj = selectedAddress;
			};
			addressService.getAddress().success(function(response) {
				$scope.addresses = response;
				$scope.countryList = filter.getCountryList(response);
				$scope.addressByCountry = filter.groupByCountry(response);
			});
			
			
		});

