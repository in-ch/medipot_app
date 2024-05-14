import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/controllers/controllers.dart';
import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/views/views.dart';

class CareerDetailPage extends GetView<CareerController> {
  const CareerDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: appTheme,
        child: const Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            fit: StackFit.expand,
            children: [
              CareerDetailSlider(imageUrls: [
                'https://cdn.pixabay.com/photo/2024/04/13/18/22/barberry-8694277_1280.jpg',
                'https://cdn.pixabay.com/photo/2024/03/30/04/56/tea-8664063_1280.jpg',
                'https://cdn.pixabay.com/photo/2024/04/20/11/47/ai-generated-8708404_1280.jpg',
                'https://cdn.pixabay.com/photo/2023/06/22/07/13/soil-8080788_1280.jpg'
              ]),
              CareerCardHeader(),
              CareerInfoCard(),
              CareerCardBottom()
            ],
          ),
        ));
  }
}
