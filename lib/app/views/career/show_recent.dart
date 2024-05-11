import 'package:flutter/material.dart';

class ShowRecent extends StatelessWidget {
  const ShowRecent({
    Key? key,
  }) : super(key: key);

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
                  "🔎 최근 본 포지션",
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 100.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                PositionItem(
                    img:
                        "https://attach.medijob.cc/file/company/heal-teun/20220808170159842172E801FA4902A4F8F7B6B532461D.png",
                    company: "본탑재활의학과의원",
                    position: "[분당 서현] 외래 진료 보조 업무 도와주실 선생님 모십니다."),
                PositionItem(
                    img:
                        "https://attach.medijob.cc/file/Legacy/logo/medijob_ssylim.gif",
                    company: "삼성열린내과",
                    position: "7호선 신대방삼거리역 삼성열린내과 정규직(주5일)"),
                PositionItem(
                    img:
                        "https://attach.medijob.cc/file/company/chambaro/20201007152249AEA2C457113B4ABB84B80DC4FAFD5FAA.jpg",
                    company: "참바로병원",
                    position: "정형외과 외과 전문의"),
                PositionItem(
                    img:
                        "https://attach.medijob.cc/file/company/entsandp/20190224085837FC2A50DFA2EA4CE494F70E786C4EF4B3.png",
                    company: "삼성 손앤박 이비인후과의원",
                    position: "이비인후과 전문의 초빙합니다."),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PositionItem extends StatelessWidget {
  const PositionItem({
    Key? key,
    required this.company,
    required this.position,
    required this.img,
  }) : super(key: key);

  final String company;
  final String position;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: SizedBox(
        width: 150,
        child: Column(children: [
          Image.network(img, width: 60, height: 60),
          Text(
            company,
            style: Theme.of(context).textTheme.labelMedium,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            position,
            style: Theme.of(context).textTheme.labelSmall,
            overflow: TextOverflow.ellipsis,
          ),
        ]),
      ),
    );
  }
}
