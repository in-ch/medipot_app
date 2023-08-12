import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class MapSubPage extends StatefulWidget {
  const MapSubPage({Key? key}) : super(key: key);

  @override
  State<MapSubPage> createState() => MapSubPageState();
}

class MapSubPageState extends State<MapSubPage> {
  late NaverMapController mapController;

  void onMapReady(NaverMapController controller) {
    mapController = controller;
    final marker2 = NMarker(id: '2', position: const NLatLng(37.5666, 126.979));
    final circle =
        NCircleOverlay(id: '1', center: const NLatLng(37.5666, 126.100));
    mapController.addOverlayAll({marker2, circle});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NaverMap(
        options: const NaverMapViewOptions(),
        onMapReady: onMapReady,
      ),
    );
  }
}
