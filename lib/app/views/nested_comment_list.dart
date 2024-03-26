import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/views/views.dart';
import 'package:docspot_app/data/models/models.dart';

class NestedCommentList extends StatelessWidget {
  const NestedCommentList({
    Key? key,
    required this.nestedReplys,
    required this.isLoading,
    required this.hasMore,
    required this.fetchMore,
  }) : super(key: key);

  final List<NestedReply> nestedReplys;
  final bool isLoading;
  final bool hasMore;
  final void Function() fetchMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          child: Column(
            children: nestedReplys
                .map((nestedReply) => _CommentData(nestedReply: nestedReply))
                .toList(),
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
                  onPressed: fetchMore,
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0), // 그림자 없애기
                    backgroundColor: MaterialStateProperty.all(
                        Colors.transparent), // 배경색 투명으로 설정하여 border 없애기
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(0), // 버튼의 모서리를 둥글지 않게 설정
                        side: BorderSide.none, // border 없애기
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
  const _CommentData({Key? key, required this.nestedReply}) : super(key: key);
  final NestedReply nestedReply;

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
          ),
          child: SizedBox(
            // Header
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Avatar.small(url: nestedReply.user.profile),
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
                                        nestedReply.user.nickname,
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
                                nestedReply.comment,
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              const SizedBox(height: 10),
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
