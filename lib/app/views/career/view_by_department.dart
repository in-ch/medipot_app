import 'package:flutter/material.dart';

class ViewByDepartment extends StatelessWidget {
  const ViewByDepartment({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "직무별 보기",
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.start,
                ),
                Text(
                  "전체보기",
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Department(
                  name: "정형외과",
                  img:
                      "https://daewon-resourse.s3.ap-northeast-2.amazonaws.com/icons/15.png"),
              Department(
                  name: "내과",
                  img:
                      "https://daewon-resourse.s3.ap-northeast-2.amazonaws.com/icons/2.png"),
              Department(
                  name: "산부인과",
                  img:
                      "https://daewon-resourse.s3.ap-northeast-2.amazonaws.com/icons/icon4.png"),
              Department(
                  name: "정신과",
                  img:
                      "https://daewon-resourse.s3.ap-northeast-2.amazonaws.com/icons/14.png"),
            ],
          ),
          const SizedBox(height: 15.0),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Department(
                  name: "소아청소년과",
                  img:
                      "https://daewon-resourse.s3.ap-northeast-2.amazonaws.com/icons/6.png"),
              Department(
                  name: "성형외과",
                  img:
                      "https://daewon-resourse.s3.ap-northeast-2.amazonaws.com/icons/5.png"),
              Department(
                  name: "피부과",
                  img:
                      "https://daewon-resourse.s3.ap-northeast-2.amazonaws.com/icons/20.png"),
              Department(
                  name: "가정의학과",
                  img:
                      "https://daewon-resourse.s3.ap-northeast-2.amazonaws.com/icons/icon1.png"),
            ],
          ),
          const SizedBox(height: 15.0),
        ],
      ),
    );
  }
}

class Department extends StatelessWidget {
  const Department({
    Key? key,
    required this.name,
    required this.img,
  }) : super(key: key);

  final String name;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.network(img, width: 60, height: 60),
      const SizedBox(height: 10),
      Text(name, style: Theme.of(context).textTheme.titleSmall)
    ]);
  }
}
