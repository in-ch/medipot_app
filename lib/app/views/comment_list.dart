import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/app/routes/routes.dart';
import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/views/views.dart';
import 'package:docspot_app/data/models/models.dart';
import 'package:docspot_app/services/services.dart';

class CommentList extends StatefulWidget {
  const CommentList({super.key, required this.writingNo});
  final int writingNo;

  @override
  State<CommentList> createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  int page = 0;
  int limit = 10;
  List<ReplyDetail> comments = [];
  bool isLoading = false;
  bool hasMore = true;

  @override
  void initState() {
    super.initState();
    fetchComments();
  }

  Future<void> fetchComments() async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });
    final response =
        await ReplysService.getReplys(widget.writingNo, page, limit);
    if (response['statusCode'] == 200) {
      final data = response['data'];
      final List<ReplyDetail> newComments = List<ReplyDetail>.from(
          data['list'].map((item) => ReplyDetail.fromJson(item)));

      setState(() {
        comments.addAll(newComments);
        page++;
        isLoading = false;
        if (newComments.length < limit) {
          hasMore = false;
        }
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          child: Column(
            children:
                comments.map((reply) => _CommentData(reply: reply)).toList(),
          ),
        ),
        if (isLoading)
          const CircularProgressIndicator()
        else if (hasMore)
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: fetchComments,
                  style: ButtonStyle(
                    elevation: WidgetStateProperty.all(0),
                    backgroundColor:
                        WidgetStateProperty.all(Colors.transparent),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                        side: BorderSide.none,
                      ),
                    ),
                  ),
                  child: const Text('댓글 더보기',
                      style: TextStyle(
                          color: Color.fromARGB(255, 66, 66, 66),
                          fontSize: 14.0)),
                )
              ],
            ),
          ),
      ],
    );
  }
}

class _CommentData extends StatelessWidget {
  const _CommentData({required this.reply});
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
                                            .bodyMedium,
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
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                    Routes.nestedReply,
                                    arguments: {
                                      'no': reply.no,
                                      'userName': reply.user.nickname,
                                    },
                                    preventDuplicates: false,
                                  );
                                },
                                child: Text(
                                  reply.totalCount < 1
                                      ? '대 댓글 달기'
                                      : '대 댓글 ${reply.totalCount}개',
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
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
