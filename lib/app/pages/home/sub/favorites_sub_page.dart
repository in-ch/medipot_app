import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:medipot_app/app/controllers/controllers.dart';
import 'package:medipot_app/app/style/theme.dart';

class FavoritesSubPage extends GetView<FavoritesController> {
  const FavoritesSubPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appTheme,
      child: Scaffold(
          appBar: AppBar(
            title: Container(),
          ),
          body: const Column(
            children: [
              Text("Hello favorites page"),
              Text("Hello favorites page"),
              Text("Hello favorites page"),
              Expanded(child: _FavoritesBody())
            ],
          )),
    );
  }
}

class _FavoritesBody extends StatelessWidget {
  const _FavoritesBody();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("Hello favorites page"),
    );
  }
}
