import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViews extends StatefulWidget {
  const MapViews({super.key});

  @override
  State<MapViews> createState() => _MapViewsState();
}

class _MapViewsState extends State<MapViews> {
  Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-0.607160, 30.654503),
    zoom: 14.4746,
  );

  // static const CameraPosition _hospital = CameraPosition(
  //   target: LatLng(-0.617600, 30.658434),
  //   zoom: 17.4746,
  // );

  var markers = {
    Marker(
      markerId: const MarkerId('1'),
      infoWindow: InfoWindow(title: 'Katete Broken Bridge'),
      position: const LatLng(-0.620630, 30.659359),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    ),
    Marker(
      markerId: const MarkerId('2'),
      infoWindow: InfoWindow(title: 'Main Hospital'),
      position: const LatLng(-0.617600, 30.658434),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: const MarkerId('3'),
      infoWindow: InfoWindow(title: 'Kashanyarazi Dark Spot'),
      position: const LatLng(-0.616832, 30.653347),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ),
    Marker(
      markerId: const MarkerId('4'),
      infoWindow: InfoWindow(title: 'Golf Course Dark Spot'),
      position: const LatLng(-0.611940, 30.656211),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ),
    Marker(
      markerId: const MarkerId('5'),
      infoWindow: InfoWindow(title: 'Bart Layers Dark Spot'),
      position: const LatLng(-0.615437, 30.655342),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ),
    Marker(
      markerId: const MarkerId('6'),
      infoWindow: InfoWindow(title: 'Independence Park Dark Spot'),
      position: const LatLng(-0.611529, 30.661105),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ),
    Marker(
      markerId: const MarkerId('7'),
      infoWindow: InfoWindow(title: 'Kiswahili Dark Spot'),
      position: const LatLng(-0.613114, 30.662275),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ),
    Marker(
      markerId: const MarkerId('8'),
      infoWindow: InfoWindow(title: 'Katete Dark Spot'),
      position: const LatLng(-0.622142, 30.659236),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ),
    Marker(
      markerId: const MarkerId('9'),
      infoWindow: InfoWindow(title: 'TankHill Dark Spot'),
      position: const LatLng(-0.614587, 30.655465),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ),
    Marker(
      markerId: const MarkerId('10'),
      infoWindow: InfoWindow(title: 'Wilbert Pharmacy'),
      position: const LatLng(-0.617970, 30.659450),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: const MarkerId('11'),
      infoWindow: InfoWindow(title: 'Blocked Road- Construction Underway'),
      position: const LatLng(-0.613212, 30.658756),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    ),
  };

  // Future<void> _gotoHospital() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_hospital));
  // }

  MapType type = MapType.satellite;
  Color but_color = Colors.white;

  void changeMapType() {
    setState(() {
      if (type == MapType.normal) {
        type = MapType.satellite;
        but_color = Colors.white;
      } else {
        type = MapType.normal;
        but_color = Colors.blue;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color(0xFF16104a),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back, color: Colors.white)),
        title: Row(
          children: [
            Text(
              'Map View',
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: GoogleMap(
                      mapType: type,
                      zoomGesturesEnabled: true, //enable Zoom in, out on map
                      initialCameraPosition: _kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      markers: markers,
                    ),
                  ),
                  Positioned(
                    bottom: 50,
                    child: IconButton(
                      onPressed: changeMapType,
                      icon:
                          Icon(Icons.change_circle, color: but_color, size: 50),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _gotoHospital,
      //   backgroundColor: Colors.grey,
      //   label: TextWidget(
      //       color: Colors.white, size: 13, bold: false, text: 'Hospital'),
      //   icon: Icon(Icons.local_hospital),
      // ),
    );
  }
}
