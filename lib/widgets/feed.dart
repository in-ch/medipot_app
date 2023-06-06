// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:medipot_app/style/theme.dart';
import 'package:medipot_app/widgets/widgets.dart';

class FeedWidget extends StatelessWidget {
  const FeedWidget({Key? key, required this.isDetail, this.hideFollow = false})
      : super(key: key);

  final bool isDetail;
  final bool hideFollow;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appTheme,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Hr(),
            !hideFollow
                ? Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, bottom: 8.0),
                    child: SizedBox(
                      // Header
                      height: 55,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
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
                                child: const Avatar.medium(
                                    url:
                                        'https://avatars.githubusercontent.com/u/49556566?v=4'),
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
                                            Text("인철",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall),
                                            PopularCard(department: 'FM'),
                                          ],
                                        ),
                                        SizedBox(height: 2),
                                        Text("3일 전",
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('샘플 제목',
                          style: Theme.of(context).textTheme.headlineSmall),
                    ),
                    Text(
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      '''가진 인간은 맺어, 얼음이 많이 싸인 것이다. 인도하겠다는 청춘 원질이 살았으며, 용기가 실현에 피다. 끝에 그들에게 주는 소담스러운 그들은 뜨고, 모래뿐일 사는가 황금시대다. 끓는 이상, 이는 얼마나 바이며, 피부가 것이다. 수 얼음과 보내는 얼마나 청춘의 영원히 이것이다. 봄날의 많이 이상은 힘차게 뜨거운지라, 얼음 속에서 있는 있는가? 않는 사는가 가는 황금시대다. 이 있을 천고에 꽃이 산야에 몸이 쓸쓸하랴? 이상 가슴에 어디 같이 곳으로 것이다. 끓는 얼마나 가슴이 있는 끓는다. 같지 방황하였으며, 소금이라 그림자는 그리하였는가?
    
    따뜻한 기쁘며, 천하를 뿐이다. 착목한는 내려온 심장의 사랑의 뿐이다. 있을 남는 생생하며, 이상은 있다. 곳으로 있으며, 별과 앞이 인간에 대중을 위하여, 봄바람이다. 
    
    이 없는 얼마나 그들의 꽃 꽃이 주며, 끓는 더운지라 사막이다. 노년에게서 목숨을 그들에게 같은 갑 봄바람을 착목한는 봄바람이다. 설산에서 어디 날카로우나 맺어, 부패뿐이다. 힘차게 가장 심장의 청춘을 이것이다. 바이며, 만물은 찾아 있으며, 사람은 창공에 따뜻한 트고, 열매를 보라. 부패를 가슴에 뛰노는 같은 일월과 곧 품고 설산에서 위하여 보라.
    
    두기 봄바람을 얼음 내려온 듣는다. 수 그들은 모래뿐일 열락의 넣는 가는 것이다. 때에, 속에서 눈이 아니한 청춘의 청춘 위하여서. 이상의 않는 어디 만천하의 있는 열매를 불어 위하여서 뭇 운다. 능히 인생에 이 우리 갑 말이다. 있는 튼튼하며, 것이다.보라, 소금이라 사막이다. 주며, 따뜻한 할지라도 사랑의 이상, 황금시대다. 같이, 그들의 내려온 긴지라 황금시대다. 소리다.이것은 품으며, 커다란 따뜻한 아니다.''',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          height: 1.6,
                          color: Colors.black87),
                    ),
                  ],
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
            // !isDetail ? const CommentFeed() : Hr()
          ],
        ),
      ),
    );
  }
}
