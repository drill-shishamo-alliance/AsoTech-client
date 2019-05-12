import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  LocationData currentLocation;

  // StreamSubscription<LocationData> locationSubscription;

  List<Marker> allMarkers = [];

  Location _locationService = new Location();
  String error;

  @override
  void initState() {
    super.initState();

    initPlatformState();

    _locationService.onLocationChanged().listen((LocationData result) async {
      setState(() {
        currentLocation = result;
//        allMarkers.add(Marker(
//            markerId: MarkerId('player1'),
//            draggable: true,
//            onTap: (){
//              print('Marker Tapped');
//            },
//            position: LatLng(currentLocation.latitude, currentLocation.longitude),
//        ));
        allMarkers.add(Marker(
            markerId: MarkerId('player2'),
            draggable: true,
            onTap: () {
              print('Marker Tapped');
            },
            position: LatLng(currentLocation.latitude + 0.00010,
                currentLocation.longitude + 0.00010),
            infoWindow: InfoWindow(title: 'player2', snippet: '泥棒')));
        allMarkers.add(Marker(
            markerId: MarkerId('player3'),
            draggable: true,
            onTap: () {
              print('Marker Tapped');
            },
            position: LatLng(currentLocation.latitude + 0.00020,
                currentLocation.longitude + 0.0005),
            infoWindow: InfoWindow(title: 'player3', snippet: '泥棒')));
      });
    });
  }

  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    if (currentLocation == null) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target:
                  LatLng(currentLocation.latitude, currentLocation.longitude),
              zoom: 18.0,
            ),
            markers: Set.from(allMarkers),
            myLocationEnabled: true,
          ),
        ),
      );
    }
  }

  void initPlatformState() async {
    LocationData myLocation;
    try {
      myLocation = await _locationService.getLocation();
      error = "";
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENITED')
        error = 'Permission denited';
      else if (e.code == 'PERMISSION_DENITED_NEVER_ASK')
        error =
            'Permission denited - please ask the user to enable it from the app settings';
      myLocation = null;
    }
    setState(() {
      currentLocation = myLocation;
    });
  }
}
