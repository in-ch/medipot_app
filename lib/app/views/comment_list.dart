// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:medipot_app/app/style/theme.dart';
import 'package:medipot_app/app/views/views.dart';
import 'package:medipot_app/data/models/models.dart';
import 'package:medipot_app/services/services.dart';

class CommentList extends StatefulWidget {
  const CommentList({Key? key, required this.writingNo}) : super(key: key);
  final int writingNo;

  @override
  State<CommentList> createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  int totalCount = 0;
  int page = 0;
  int limit = 10;

  List<ReplyDetail> list = [];
  Future<List<ReplyDetail>> fetchList(
      int writingNo, int page, int limit) async {
    try {
      final response = await ReplysService.getReplys(writingNo, page, limit);
      if (response['statusCode'] == 200) {
        final data = response['data'];
        final list = List<ReplyDetail>.from(
            data['list'].map((item) => ReplyDetail.fromJson(item)));
        totalCount = response['totalCount'];
        page = data['page'];

        return list;
      }
    } catch (error) {
      print("-------Error-------");
      print(error);
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ReplyDetail>>(
      future: fetchList(widget.writingNo, page, limit),
      builder:
          (BuildContext context, AsyncSnapshot<List<ReplyDetail>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('오류 발생: ${snapshot.error}');
        } else if (snapshot.hasData && snapshot.data!.isEmpty) {
          return const Text('데이터가 없습니다.');
        } else {
          return Column(
            children: snapshot.data!
                .map((reply) => _CommentData(reply: reply))
                .toList(),
          );
        }
      },
    );
  }
}

class _CommentData extends StatelessWidget {
  const _CommentData({Key? key, required this.reply}) : super(key: key);
  final ReplyDetail reply;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appTheme,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black26,
              width: 0.2,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 15,
            bottom: 15,
          ),
          child: SizedBox(
            // Header
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Avatar.small(url: reply.user.profile),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        reply.user.nickname,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                      const SizedBox(width: 10),
                                      const Text(
                                        '3 일전',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                  const Icon(
                                    CupertinoIcons.ellipsis_vertical,
                                    size: 15,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                reply.comment,
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Get.to(const ReplyScreen(),
                                      //     transition: Transition.cupertino);
                                    },
                                    child: Text(
                                      '대 댓글 7개',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                  ),
                                ],
                              ),
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
        ),
      ),
    );
  }
}
