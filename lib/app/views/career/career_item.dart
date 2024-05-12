import 'package:flutter/cupertino.dart';

import 'package:docspot_app/app/style/theme.dart';

class CareerItem extends StatelessWidget {
  const CareerItem({
    super.key,
    required this.company,
    required this.position,
    required this.img,
  });

  final String company;
  final String position;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Image.network(
                img,
                width: double.infinity,
                height: 100,
                fit: BoxFit.fitWidth,
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Opacity(
                  opacity: 0.4,
                  child: Icon(CupertinoIcons.bookmark_fill,
                      color: colorScheme.primary),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 65,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Text(company,
                  style: const TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.w600)),
              const SizedBox(height: 5),
              Text(position,
                  style: const TextStyle(
                      fontSize: 12.0, fontWeight: FontWeight.w300))
            ],
          ),
        ),
      ],
    );
  }
}
