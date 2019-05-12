import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Demon extends StatefulWidget {
  @override
  _DemonState createState() => _DemonState();
}

class _DemonState extends State<Demon> {
  LocationData currentLocation;
  // StreamSubscription<LocationData> locationSubscription;

  Location _locationService = new Location();
  String error;

  @override
  void initState() {
    super.initState();
    initPlatformState();

    _locationService.onLocationChanged().listen((LocationData result) async {
      setState(() {
        currentLocation = result;
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
          appBar: AppBar(
            title: Text("AsoTech"),
          ),
          body: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(currentLocation.latitude, currentLocation.longitude),
              zoom: 17.0,
            ),
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
