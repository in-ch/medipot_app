import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatelessWidget {
  const GoogleMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: double.infinity,
          height: 200,
          child: GoogleMap(
            mapToolbarEnabled: false,
            rotateGesturesEnabled: false,
            scrollGesturesEnabled: false,
            zoomControlsEnabled: false,
            zoomGesturesEnabled: false,
            initialCameraPosition: CameraPosition(
                zoom: 11,
                target: LatLng(37.43296265331129, -122.08832357078792)),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text("서울특별시 성동구 능동 102-31, 201",
            style: Theme.of(context).textTheme.displayMedium),
      ],
    );
  }
}
