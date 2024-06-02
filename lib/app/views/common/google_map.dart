import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatelessWidget {
  const GoogleMapWidget(
      {super.key, required this.address, required this.lat, required this.lng});

  final String address;
  final double lat;
  final double lng;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: GoogleMap(
            mapToolbarEnabled: false,
            rotateGesturesEnabled: false,
            scrollGesturesEnabled: false,
            zoomControlsEnabled: false,
            zoomGesturesEnabled: false,
            initialCameraPosition:
                CameraPosition(zoom: 14, target: LatLng(lat, lng)),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(address, style: Theme.of(context).textTheme.displayMedium),
      ],
    );
  }
}
