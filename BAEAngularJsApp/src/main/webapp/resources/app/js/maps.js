angular.module('BAEApp.maps', ['uiGmapgoogle-maps']).config(
    ['uiGmapGoogleMapApiProvider', function(GoogleMapApiProviders) {
        GoogleMapApiProviders.configure({
            malaysia: true
          
        });
    }]
);