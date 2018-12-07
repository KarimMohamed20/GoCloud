import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatefulWidget {
  final hospitalName;
  final sectionName;
  final lat;
  final lng;
  MapsPage({this.hospitalName, this.sectionName, this.lat, this.lng});
  @override
  State createState() => MapsPageState();
}

class MapsPageState extends State<MapsPage> {
  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(25, 27, 76, 1),
        title: Text(widget.hospitalName,
            style: TextStyle(color: Colors.white)),
      ),
      body: widget.lat == null || widget.lng == null
                ?new Center(child: Text('Sorry we haven\'t added location yet',
                style: TextStyle(
                  fontSize: 20
                )),):Center(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
              ),
            ),
          ) 
                
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
      mapController.animateCamera(CameraUpdate.newCameraPosition(
        new CameraPosition(
          bearing: 270.0,
          target: LatLng(widget.lat, widget.lng),
          zoom: 17.0,
        ),
      ));
    });
  }
}
