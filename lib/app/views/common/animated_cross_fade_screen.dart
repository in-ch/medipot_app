import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedCrossFadeScreen extends StatefulWidget {
  const AnimatedCrossFadeScreen({Key? key}) : super(key: key);

  @override
  AnimatedCrossFadeScreenState createState() => AnimatedCrossFadeScreenState();
}

class AnimatedCrossFadeScreenState extends State<AnimatedCrossFadeScreen> {
  bool selected = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 800), (timer) {
      setState(() {
        selected = !selected;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // 타이머 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: AnimatedCrossFade(
          duration: const Duration(milliseconds: 200),
          firstChild: Image.asset(
            'assets/image/logo.png',
            width: 100,
          ),
          secondChild: Image.asset(
            'assets/image/logo_text.png',
            width: 100,
          ),
          crossFadeState:
              selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
      ),
    );
  }
}
