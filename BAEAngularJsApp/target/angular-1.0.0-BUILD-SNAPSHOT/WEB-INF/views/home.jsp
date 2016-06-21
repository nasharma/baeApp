<!DOCTYPE html>
<html>
<head>
<title>BAE Address App</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="resources/css/home.css">


</head>

<body ng-app="BAEApp" ng-controller="addressController" ng-cloak>
	<h1>Welcome to BAE Addresses application</h1>

	<nav class="{{active}}" ng-click="$event.preventDefault()">

		<a href="#" class="home" ng-click="active='home'">View Data</a> 
		<a href="#" class="groupByCountry" ng-click="active='groupByCountry'">Group	By Country</a> 
		<a href="#" class="groupByCity" ng-click="active='groupByCity'">Group By City</a>
		<a href="#" class="showOnMap" ng-click="active='showOnMap'">Show On Map</a>

	</nav>

	<div ng-show="active == 'home'" ng-hide="active != 'home'" ng-cloak>

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
		ng-hide="active != 'groupByCountry'" ng-cloak>
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
	
	
	<div ng-show="active == 'groupByCity'"
		ng-hide="active != 'groupByCity'" ng-cloak>
		<table ng-repeat="currentCity in cityList"
			class="table table-hover table-bordered table-responsive table-striped">
			<caption class="tableCaption">City Name: {{
				currentCity }}</caption>
			<tr>
				<th>Address</th>
				<th>City</th>
				<th>Country</th>
				<th>Postal Code</th>
				<th>Longitude</th>
				<th>Latitude</th>
			</tr>
			<tr
				ng-repeat="address in addressByCity | filter: {city:  currentCity}">
				<td>{{ address.address }}</td>
				<td>{{ address.city }}</td>
				<td>{{ address.country }}</td>
				<td>{{ address.postalCode }}</td>
				<td>{{ address.lng }}</td>
				<td>{{ address.lat }}</td>
			</tr>
		</table>
	</div>

	<div ng-style="{'visibility': active == 'showOnMap' ? 'visible':'hidden'}"
		ng-cloak>
		<select name="lngSelect" id="lngSelect"  ng-model="selectedAddress" 
			ng-change="changeAddress()" ng-cloak>
			<option ng-repeat="address in addresses" value='{{address}}' ng-cloak>{{address.address}} {{address.city}}, {{address.country}}, {{address.postalCode}}</option>
		</select>


		<p ng-show="selectedAddressObj != undefined" ng-cloak>
			
			<span> Latitude: {{selectedAddressObj.lat}} Longitude: {{selectedAddressObj.lng}} </span>
		</p>

		<ui-gmap-google-map center="map.center" zoom="map.zoom"
			draggable="true" refresh="true" id="addressMap" ng-cloak> 
			<ui-gmap-markers
			models="map.markers" coords="'self'" icon="'icon'"
			click="onMarkerClicked" options="'options'"
			events="map.markers.events" ng-cloak> 
				<ui-gmap-windows
				show="'showWindow'" closeClick="'closeClick'" ng-cloak>
		<div>
			<span>
				{{selectedAddressObj.address}} {{selectedAddressObj.city}},{{selectedAddressObj.country}}, {{selectedAddressObj.postalCode}}
			</span>
			<br/>
			<span> Latitude: {{selectedAddressObj.lat}} Longitude: {{selectedAddressObj.lng}} </span>
		</div>
		</ui-gmap-windows> </ui-gmap-markers> </ui-gmap-google-map>

	</div>

	<script src="resources/js-lib/lodash.js"></script>
	<script src="resources/js-lib/jquery.min.js"></script>
	<script src="resources/js-lib/angular.js"></script>
	<script src="resources/js-lib/angular-route.min.js"></script>
	<script src="resources/js-lib/bootstrap.min.js"></script>
	<script src='resources/js-lib/angular-simple-logger.js'></script>
	<script src='resources/js-lib/angular-google-maps.min.js'></script>
	<script src="resources/app/js/app.js"></script>
	<script src="resources/app/js/services.js"></script>
	<script src="resources/app/js/utils.js"></script>
	<script src="resources/app/js/maps.js"></script>
	<script src="resources/app/js/controllers.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
</body>
</html>