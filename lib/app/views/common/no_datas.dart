import 'package:flutter/material.dart';

class NoDatas extends StatelessWidget {
  const NoDatas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('정보가 없습니다.', style: TextStyle(color: Colors.white))
            ],
          )
        ],
      ),
    );
  }
}
