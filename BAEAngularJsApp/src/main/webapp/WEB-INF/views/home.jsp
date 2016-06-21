<!DOCTYPE html>
<html>
<head>
<title>BAE Address App</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/home.css">
</head>

<body ng-app="BAEApp" ng-controller="addressController">
	<h1>Welcome to BAE Addresses application</h1>

	<nav class="{{active}}" ng-click="$event.preventDefault()">

		<a href="#" class="home" ng-click="active='home'">View Data</a> <a
			href="#" class="groupByCountry" ng-click="active='groupByCountry'">Group
			By Country</a> <a href="#" class="showOnMap"
			ng-click="active='showOnMap'">Show On Map</a>

	</nav>

	<div ng-show="active == 'home'" ng-hide="active != 'home'">

		<table
			class="table table-hover table-bordered table-responsive table-striped">

			<thead>
				<tr>
					<th>Address</th>
					<th>City</th>
					<th>Country</th>
					<th>Postal Code</th>
					<th>Longitude</th>
					<th>Latitude</th>
				</tr>
			</thead>
			<tbody>
				<tr ng-repeat="address in addresses">
					<td>{{ address.address }}</td>
					<td>{{ address.city }}</td>
					<td>{{ address.country }}</td>
					<td>{{ address.postalCode }}</td>
					<td>{{ address.lng }}</td>
					<td>{{ address.lat }}</td>
				</tr>
			</tbody>
		</table>

	</div>


	<div ng-show="active == 'groupByCountry'"
		ng-hide="active != 'groupByCountry'">
		<table ng-repeat="currentCountry in countryList"
			class="table table-hover table-bordered table-responsive table-striped">
			<caption class="tableCaption">Country Name: {{
				currentCountry }}</caption>
			<tr>
				<th>Address</th>
				<th>City</th>
				<th>Country</th>
				<th>Postal Code</th>
				<th>Longitude</th>
				<th>Latitude</th>
			</tr>
			<tr
				ng-repeat="address in addressByCountry | filter: {country:  currentCountry}">
				<td>{{ address.address }}</td>
				<td>{{ address.city }}</td>
				<td>{{ address.country }}</td>
				<td>{{ address.postalCode }}</td>
				<td>{{ address.lng }}</td>
				<td>{{ address.lat }}</td>
			</tr>
		</table>
	</div>

	<div ng-show="active == 'showOnMap'" ng-hide="active != 'showOnMap'">
		<select name="lngSelect" id="lngSelect" ng-model="selectedAddress"
			ng-change="changeAddress()">
			<option ng-repeat="address in addresses" value='{{address}}'>{{address.address}}</option>
		</select>
		<p ng-show="selectedAddressObj != undefined">
			<span stype="">Address: </span>{{selectedAddressObj.address}} <span>
				City: </span>{{selectedAddressObj.city}}
		</p>
		<ui-gmap-google-map center='map.center' zoom='map.zoom' style="width: 100%;  height: 100%">
		<ui-gmap-marker ng-repeat="m in map.markers" coords="m.coords"
			icon="m.icon" idkey="m.id"></ui-gmap-marker> </ui-gmap-google-map>

	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.7/angular.js"></script>
	<script src="https://code.angularjs.org/1.5.7/angular-route.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
		integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/lodash/3.8.0/lodash.min.js"></script>
	<script src='resources/js-lib/angular-simple-logger.js'></script>
	<script src='resources/js-lib/angular-google-maps.min.js'></script>
	<script src='//maps.googleapis.com/maps/api/js?sensor=false'></script>
	<script src="resources/app/js/app.js"></script>
	<script src="resources/app/js/services.js"></script>
	<script src="resources/app/js/utils.js"></script>
	<script src="resources/app/js/controllers.js"></script>
	<script src="resources/app/js/maps.js"></script>

</body>
</html>