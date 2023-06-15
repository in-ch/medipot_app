// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:medipot_app/app/routes/routes.dart';

import 'package:medipot_app/app/style/theme.dart';
import 'package:medipot_app/app/views/views.dart';
import 'package:medipot_app/data/models/models.dart';
import 'package:share_plus/share_plus.dart';

class FeedWidget extends StatelessWidget {
  FeedWidget(
      {Key? key,
      required this.isDetail,
      this.hideFollow = false,
      required this.writing})
      : super(key: key);

  final bool isDetail;
  final bool hideFollow;
  Writing writing;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appTheme,
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            !hideFollow
                ? Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, bottom: 8.0),
                    child: SizedBox(
                      // Header
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  Share.share(
                                    await DynamicLink().getShortLink(
                                      'detail',
                                      writing.no,
                                    ),
                                  );
                                },
                                child: Text("공유",
                                    style: TextStyle(color: Colors.red)),
                              ),
                              GestureDetector(
                                onTap: () => {
                                  showModalBottomSheet<void>(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      context: context,
                                      builder: (BuildContext context) {
                                        return FollowModal();
                                      })
                                },
                                child: Avatar.medium(url: writing.user.profile),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(writing.user.nickname,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall),
                                            PopularCard(
                                                department:
                                                    writing.user.department),
                                          ],
                                        ),
                                        SizedBox(height: 2),
                                        Text("31123일 전",
                                            style: TextStyle(
                                                fontSize: 13.0,
                                                color: Colors.black54)),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
            Container(
              // body
              constraints: const BoxConstraints(
                minWidth: double.infinity,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      Routes.detail,
                      arguments: {
                        'no': writing.no,
                      },
                      preventDuplicates: false,
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(writing.title,
                            style: Theme.of(context).textTheme.headlineSmall),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          maxLines: isDetail ? 100 : 3,
                          overflow: TextOverflow.ellipsis,
                          writing.text,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              height: 1.6,
                              color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              // footer
              height: 30.0,
              child: Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 3.0),
                  child: FeedButtons()),
            ),
            isDetail ? CommentList() : Hr()
          ],
        ),
      ),
    );
  }
}
