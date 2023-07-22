// ignore_for_file: must_call_super

import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

class MapSubPage extends StatefulWidget {
  const MapSubPage({Key? key}) : super(key: key);

  @override
  State<MapSubPage> createState() => MapSubPageState();
}

class MapSubPageState extends State<MapSubPage> {
  late KakaoMapController mapController;

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KakaoMap(
        onMapCreated: (controller) async {
          mapController = controller;

          markers.add(Marker(
            markerId: UniqueKey().toString(),
            latLng: await mapController.getCenter(),
          ));
          setState(() {});
        },
        center: LatLng(
          36.6083,
          127.4358,
        ),
        zoomControl: true,
        zoomControlPosition: ControlPosition.bottomRight,
        markers: markers.toList(),
      ),
    );
  }
}
