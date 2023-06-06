import 'package:flutter/material.dart';
import 'package:medipot_app/widgets/widgets.dart';

class Feeds extends StatelessWidget {
  const Feeds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FeedWidget(
            isDetail: false,
            hideFollow: false,
          ),
          FeedWidget(
            isDetail: false,
            hideFollow: false,
          ),
          FeedWidget(
            isDetail: false,
            hideFollow: false,
          ),
          FeedWidget(
            isDetail: false,
            hideFollow: false,
          ),
        ],
      ),
    );
  }
}
