import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hotel/core/color.dart';
import 'package:hotel/extentions/extentions.dart';

class CityMapScreen extends StatefulWidget {
  final String cityName;

  const CityMapScreen({super.key, required this.cityName});


  @override
  State<CityMapScreen> createState() => _CityMapScreenState();
}

class _CityMapScreenState extends State<CityMapScreen> {
  late GoogleMapController mapController;
  LatLng? cityLocation;

  @override
  void initState() {
    super.initState();
    _getCityCoordinates(widget.cityName);
  }

  Future<void> _getCityCoordinates(String cityName) async {
    try {
      List<Location> locations = await locationFromAddress(cityName);
      if (locations.isNotEmpty) {
        setState(() {
          cityLocation = LatLng(locations[0].latitude, locations[0].longitude);
        });
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 30.h,
      width: 90.w,
      decoration: BoxDecoration(
        color: ColorConstants.grey,
          borderRadius: BorderRadius.circular(30)),
      child: cityLocation == null
          ? Center(child: CircularProgressIndicator(color: ColorConstants.black,))
          : GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: cityLocation!,
                zoom: 12.0,
              ),
              markers: {
                Marker(
                  markerId: MarkerId(widget.cityName),
                  position: cityLocation!,
                  infoWindow: InfoWindow(
                    title: widget.cityName,
                  ),
                ),
              },
            ),
    );
  }
}
