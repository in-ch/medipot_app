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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: const Color.fromARGB(255, 243, 243, 243),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    img,
                    width: double.infinity,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),
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
              Text(position,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 12.0, fontWeight: FontWeight.w300))
            ],
          ),
        ),
      ],
    );
  }
}
