import 'package:flutter/material.dart';

import 'package:docspot_app/app/views/common/tag.dart';

class TaroResultModal extends StatelessWidget {
  final int resultNum;

  const TaroResultModal({super.key, required this.resultNum});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        width: double.infinity,
        height: screenHeight * 0.90,
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 15),
            Center(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                child: Container(
                  width: 50,
                  height: 8,
                  color: const Color.fromARGB(255, 180, 180, 180),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              // 스크롤을 가능하게 하는 부분
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Image.network(
                        "https://medipot-uploads.s3.ap-northeast-2.amazonaws.com/game/taro_$resultNum.jpg",
                        width: 150,
                        height: 255,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _getCardName(resultNum),
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _getHead1(resultNum),
                                textAlign: TextAlign.left,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: _getKeywords(resultNum)
                                    .map((keyword) => Tag(text: keyword))
                                    .toList(),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                _getHead2(resultNum),
                                textAlign: TextAlign.left,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                _getHeadResult2(resultNum),
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                _getHead3(resultNum),
                                textAlign: TextAlign.left,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                _getHeadResult3(resultNum),
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "해석",
                                textAlign: TextAlign.left,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                _getHeadResult4(resultNum),
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              const SizedBox(height: 100),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String _getCardName(int resultNum) {
    switch (resultNum) {
      case 1:
        return '마법사 카드';
      case 2:
        return '여사제 카드';
      case 3:
        return '여황제 카드';
      case 4:
        return '황제 카드';
      case 5:
        return '교황 카드';
      case 6:
        return '연인 카드';
      case 7:
        return '전차 카드';
      case 8:
        return '힘 카드';
      case 9:
        return '은둔자 카드';
      case 10:
        return '운명의 수레바퀴 카드';
      default:
        return 'Unknown card. Try again.';
    }
  }

  String _getHead1(int resultNum) {
    switch (resultNum) {
      case 1:
        return '마법사 카드의 키워드';
      case 2:
        return '여사제 카드의 키워드';
      case 3:
        return '여황제 카드의 키워드';
      case 4:
        return '황제 카드의 키워드';
      case 5:
        return '교황 카드의 키워드';
      case 6:
        return '연인 카드의 키워드';
      case 7:
        return '전차 카드의 키워드';
      case 8:
        return '힘 카드의 키워드';
      case 9:
        return '은둔자 카드의 키워드';
      case 10:
        return '운명의 수레바퀴 카드의 키워드';
      default:
        return 'Unknown card. Try again.';
    }
  }

  String _getHead2(int resultNum) {
    switch (resultNum) {
      case 1:
        return '마법사 카드의 스토리';
      case 2:
        return '여사제 카드의 스토리';
      case 3:
        return '여황제 카드의 스토리';
      case 4:
        return '황제 카드의 스토리';
      case 5:
        return '교황 카드의 스토리';
      case 6:
        return '연인 카드의 스토리';
      case 7:
        return '전차 카드의 스토리';
      case 8:
        return '힘 카드의 스토리';
      case 9:
        return '은둔자 카드의 스토리';
      case 10:
        return '운명의 수레바퀴 카드의 스토리';
      default:
        return '';
    }
  }

  String _getHeadResult2(int resultNum) {
    switch (resultNum) {
      case 1:
        return '''마법사 카드의 이미지는 마법사가 한 손에 봉을 들고 하늘을 향해 다른 손을 올린 모습이 담겨 있습니다. 그의 머리 위에는 무한을 상징하는 뫼비우스 띠가 있으며, 이는 무한한 가능성과 연결된 상태를 나타냅니다. 그의 주변에는 장미와 백합이 가득하여 아름다움과 순수함을 강조합니다. 마법사 앞에는 컵, 동전, 검, 지팡이 등 네 가지의 상징이 놓여 있어, 그의 능력과 자원을 다루는 능력을 나타냅니다. 이 이미지는 창의력과 자원 활용의 중요성을 강조하며, 새로운 기회를 창출할 수 있는 능력을 상징합니다.''';
      case 2:
        return '''여사제 카드의 이미지는 조용한 환경에서 두 개의 열두 가지 상징이 장식된 두 개의 기둥 사이에 앉아 있는 여사제를 보여줍니다. 여사제의 뒤에는 성스러운 장막이 있으며, 이는 신성과 인간성의 경계를 의미합니다. 여사제의 손에는 두 개의 열쇠가 들려 있으며, 이는 신비롭고 내면의 진리를 여는 힘을 상징합니다. 이 이미지는 직관과 내면의 지혜를 통해 중요한 정보를 얻을 수 있음을 나타냅니다.''';
      case 3:
        return '''여황제 카드의 이미지는 넓은 초원에 앉아 있는 여황제를 묘사합니다. 그녀의 주변에는 풍성한 식물과 꽃들이 가득 차 있으며, 이는 자연의 풍요로움을 상징합니다. 여황제는 왕좌에 앉아 있으며, 그녀의 상징적인 왕관과 드레스는 풍요와 모성애를 강조합니다. 이 이미지는 안정감과 풍요로운 결과를 얻는 것의 중요성을 나타냅니다.''';
      case 4:
        return '''황제 카드의 이미지는 권위 있는 황제가 왕좌에 앉아 있는 모습을 보여줍니다. 그의 왕좌는 안정성과 구조를 상징하며, 황제는 강력한 지팡이를 손에 들고 있습니다. 그의 주변에는 산과 성이 보이며, 이는 그의 지배력과 권력을 나타냅니다. 이 이미지는 안정성과 질서를 유지하는 것의 중요성을 강조합니다.''';
      case 5:
        return '''교황 카드의 이미지는 성스러운 장소에서 교황이 앉아 있는 모습을 담고 있습니다. 그의 손에는 성경이 들려 있으며, 주변에는 신앙과 가르침의 상징들이 배치되어 있습니다. 교황의 두 개의 열쇠는 신성한 권위를 상징하며, 이는 도덕적 가르침과 전통의 중요성을 강조합니다. 이 이미지는 신앙과 도덕적 가르침을 통한 안정과 지혜를 나타냅니다.''';
      case 6:
        return '''연인 카드의 이미지는 두 사람이 서로를 바라보며 손을 잡고 있는 모습이 그려져 있습니다. 배경에는 사랑의 상징과 조화로운 자연이 배치되어 있습니다. 이 이미지는 감정적 유대와 관계의 중요성을 강조하며, 두 사람 간의 깊은 연결과 사랑의 힘을 나타냅니다.''';
      case 7:
        return '''전차 카드의 이미지는 전차를 몰고 있는 전사의 모습을 보여줍니다. 전차는 강력한 의지와 결단력을 상징하며, 전사는 도전과 승리를 향해 나아가고 있습니다. 전차의 주변에는 전투의 상징과 도전의 이미지가 포함되어 있으며, 이는 결단력과 집중력을 통한 승리를 나타냅니다.''';
      case 8:
        return '''힘 카드의 이미지는 힘이 강한 인물이 야생의 동물을 부드럽게 다루고 있는 모습입니다. 이 인물은 내면의 힘과 용기를 상징하며, 동물과의 조화를 통해 자신의 힘을 제어하는 모습이 그려져 있습니다. 주변에는 용기와 인내를 상징하는 이미지들이 배치되어 있으며, 이는 내면의 힘을 발휘하는 것의 중요성을 강조합니다.''';
      case 9:
        return '''은둔자 카드의 이미지는 고요한 자연 속에서 명상하는 은둔자의 모습이 그려져 있습니다. 은둔자는 조용한 환경에서 자신의 내면을 탐색하고 있으며, 주변에는 고요함과 명상을 상징하는 이미지가 배치되어 있습니다. 이 이미지는 자기 반성과 내면 탐색의 중요성을 나타냅니다.''';
      case 10:
        return '''운명의 수레바퀴 카드의 이미지는 큰 수레바퀴가 돌아가는 모습이 그려져 있습니다. 수레바퀴는 인생의 주기와 변화를 상징하며, 주변에는 변화와 순환을 나타내는 상징들이 배치되어 있습니다. 이 이미지는 운명과 변화의 흐름에 적응하는 것의 중요성을 강조합니다.''';
      default:
        return 'Unknown card. Try again.';
    }
  }

  String _getHead3(int resultNum) {
    switch (resultNum) {
      case 1:
        return '마법사 카드의 이미지';
      case 2:
        return '여사제 카드의 이미지';
      case 3:
        return '여황제 카드의 이미지';
      case 4:
        return '황제 카드의 이미지';
      case 5:
        return '교황 카드의 이미지';
      case 6:
        return '연인 카드의 이미지';
      case 7:
        return '전차 카드의 이미지';
      case 8:
        return '힘 카드의 이미지';
      case 9:
        return '은둔자 카드의 이미지';
      case 10:
        return '운명의 수레바퀴 카드의 이미지';
      default:
        return 'Unknown card. Try again.';
    }
  }

  String _getHeadResult3(int resultNum) {
    switch (resultNum) {
      case 1:
        return '''마법사 카드: 이 카드에는 테이블 위에 다양한 상징적인 도구들이 놓여 있으며, 중앙에는 지팡이를 들고 있는 마법사가 그려져 있습니다. 마법사는 그의 앞에 놓인 금화, 칼, 컵, 펜타클을 이용해 모든 원소와 힘을 조화롭게 다루는 모습을 보이고 있습니다. 그의 오른손에는 지팡이를 쥐고 있으며, 이는 그가 자연의 힘과 인생의 도구를 제어하는 능력을 상징합니다. 마법사의 배경은 종종 무대의 장막처럼 보이는 신비로운 분위기로, 그의 능력과 잠재력을 강조합니다. 이 카드는 창조성과 능력, 새로운 시작의 가능성을 나타냅니다.''';
      case 2:
        return '''여사제 카드: 여사제는 고요한 분위기의 성전과 신성한 공간에 앉아 있으며, 그녀의 뒤에는 신비로운 커튼이 드리워져 있습니다. 그녀는 손에 성서를 들고 있으며, 그 위에는 고대의 상징과 문자가 적혀 있어 숨겨진 지식과 지혜를 상징합니다. 여사제의 좌우에는 두 개의 기둥이 있으며, 이는 균형과 조화를 상징합니다. 카드의 배경은 종종 달의 상징으로 장식되어 있으며, 이는 직관과 내면의 탐색을 의미합니다. 이 카드는 비밀의 발견과 심오한 통찰력을 나타냅니다.''';
      case 3:
        return '''여황제 카드: 이 카드에는 넓은 초원과 꽃들, 곡물들 사이에서 앉아 있는 여황제의 이미지가 담겨 있습니다. 그녀는 풍성한 식물들과 과일들로 둘러싸여 있으며, 이는 자연의 풍요와 삶의 풍성함을 상징합니다. 여황제의 옷과 왕좌는 대개 금색과 녹색으로 장식되어 있으며, 이는 부와 번영을 나타냅니다. 카드의 배경에는 자연의 아름다움이 담겨 있으며, 이는 생명의 순환과 풍요로움을 의미합니다. 이 카드는 풍요로운 삶과 안정된 가정, 자연의 축복을 나타냅니다.''';
      case 4:
        return '''황제 카드: 황제는 거대한 왕좌에 앉아 있으며, 그의 손에는 권력의 상징인 지팡이가 들려 있습니다. 황제의 왕좌는 대개 강력하고 웅장한 디자인으로, 권위와 지배력을 강조합니다. 그의 배경에는 성이나 산과 같은 견고한 구조물들이 보이며, 이는 안정성과 권력을 상징합니다. 황제의 얼굴은 결단력과 지혜를 나타내며, 그의 자세는 확고한 의지와 리더십을 보여줍니다. 이 카드는 권력, 안정성, 그리고 지도력을 나타냅니다.''';
      case 5:
        return '''교황 카드: 교황은 두 제자와 함께 신성한 의식을 진행하고 있으며, 그의 손에는 축복의 상징인 지팡이가 들려 있습니다. 교황의 배경에는 교회나 성전이 그려져 있으며, 이는 신의 뜻과 가르침을 전하는 역할을 강조합니다. 교황의 옷은 대개 화려하게 장식되어 있으며, 이는 신성함과 권위를 나타냅니다. 카드의 상단에는 기도하는 손이나 신성한 상징이 그려져 있어, 영적 안내와 지도를 상징합니다. 이 카드는 신의 가르침과 영적 지도를 나타냅니다.''';
      case 6:
        return '''연인 카드: 이 카드에는 두 연인이 천사의 축복 아래에서 손을 맞잡고 있는 모습이 그려져 있습니다. 연인의 배경에는 아름다운 자연경관이나 신성한 공간이 그려져 있으며, 이는 사랑과 조화의 상징입니다. 두 연인은 서로의 눈을 맞추며 깊은 연결을 표현하고 있으며, 카드 위에는 천사의 날개나 다른 신성한 상징이 그려져 있습니다. 이 카드는 사랑, 조화, 그리고 관계의 깊이를 나타냅니다.''';
      case 7:
        return '''전차 카드: 전차를 몰고 있는 전사는 결연한 표정으로 전진하고 있으며, 전차의 두 마차는 강력한 힘을 상징합니다. 카드의 배경에는 전쟁터나 승리를 상징하는 이미지가 그려져 있으며, 이는 목표를 향한 끊임없는 추진력을 나타냅니다. 전사의 손에는 전투의 상징인 지팡이나 검이 들려 있으며, 전차의 바퀴는 빠르게 회전하고 있습니다. 이 카드는 목표 달성, 승리, 그리고 의지를 나타냅니다.''';
      case 8:
        return '''힘 카드: 무서운 사자를 다루고 있는 여성의 이미지가 그려져 있습니다. 여자는 사자의 입을 부드럽게 다루며, 이는 내면의 힘과 용기를 상징합니다. 카드의 배경에는 자연의 아름다움이나 신성한 공간이 그려져 있으며, 이는 힘의 조화와 통제를 의미합니다. 여성의 표정은 부드럽지만 결단력 있으며, 이는 진정한 힘이란 내면의 평화와 용기에서 비롯된다는 메시지를 전달합니다. 이 카드는 용기, 인내, 그리고 내면의 힘을 나타냅니다.''';
      case 9:
        return '''은둔자 카드: 어두운 동굴 속에서 등불을 들고 길을 찾고 있는 은둔자의 모습이 그려져 있습니다. 은둔자는 그의 앞길을 비추는 등불을 들고 있으며, 이는 내면의 탐색과 자아 발견을 상징합니다. 카드의 배경은 어두운 동굴이나 깊은 숲으로, 이는 심오한 통찰력과 지혜의 추구를 의미합니다. 은둔자의 모습은 혼자서도 길을 찾을 수 있는 강한 내면의 힘을 나타냅니다. 이 카드는 자기 탐색, 내면의 지혜, 그리고 고독을 의미합니다.''';
      case 10:
        return '''운명의 수레바퀴 카드: 커다란 수레바퀴가 회전하고 있으며, 그 주위에는 다양한 생명체들이 보입니다. 수레바퀴는 끊임없이 회전하며, 이는 운명의 변화와 순환을 상징합니다. 카드의 배경에는 천상의 상징이나 우주적인 이미지가 그려져 있으며, 이는 운명과 변화의 본질을 의미합니다. 수레바퀴의 다양한 생명체는 인생의 다양한 측면을 나타내며, 변화와 적응의 필요성을 강조합니다. 이 카드는 운명, 변화, 그리고 삶의 순환을 나타냅니다.''';
      default:
        return 'Unknown card. Try again.';
    }
  }

  String _getHeadResult4(int resultNum) {
    switch (resultNum) {
      case 1:
        return '''이 카드는 당신이 자신의 능력과 자원을 활용하여 새로운 기회를 창출할 수 있는 날임을 의미합니다. 오늘은 특히 창의력과 자기 신뢰를 바탕으로 중요한 결정을 내리거나 문제를 해결하는 데 강력한 에너지가 주어질 것입니다. 새로운 프로젝트나 아이디어를 시작하기에 적합한 시점이며, 자신의 직관과 능력을 믿고 적극적으로 행동해보세요. 마법사의 에너지를 통해 긍정적인 변화를 이끌어내는 것이 중요하며, 그로 인해 새로운 가능성을 열 수 있습니다. 또한, 당신의 능력을 신뢰하고, 독창적인 해결책을 찾는 것이 성공의 열쇠가 될 것입니다.''';
      case 2:
        return '''여사제 카드는 내면의 지혜와 직관을 중요시하는 날임을 뜻합니다. 오늘은 감정적으로 복잡한 상황에 직면할 수 있으며, 이를 해결하기 위해 깊은 통찰력과 내면의 목소리에 귀 기울이는 것이 중요합니다. 여사제는 신성과 인간성의 경계를 허물며, 직관적인 이해를 통해 상황을 정리하고, 자신에게 필요한 정보를 얻을 수 있도록 도와줍니다. 자신의 내면을 탐색하고, 조용히 성찰하는 시간을 가지며, 중요한 결정을 내리기 전에 신중하게 생각해 보세요. 영적이고 감성적인 면이 중요한 역할을 할 것입니다.''';
      case 3:
        return '''여황제 카드는 풍요와 모성애를 상징하며, 주변과 조화를 이루고, 풍요로운 결과를 얻을 수 있는 날임을 의미합니다. 오늘은 가족이나 공동체와의 관계를 강화하고, 주변의 아름다움을 감상하며, 자신의 창조적 재능과 자원을 최대한 활용하는 것이 중요합니다. 여황제의 에너지는 안정감과 풍요를 가져다주며, 이를 통해 자신의 목표를 달성하고, 행복을 찾는 데 도움을 줄 것입니다. 또한, 긍정적인 관계를 통해 지원과 격려를 받을 수 있으며, 이는 당신의 삶에 큰 영향을 미칠 것입니다.''';
      case 4:
        return '''황제 카드는 권력과 안정성을 상징하며, 중요한 결정을 내릴 준비가 되어 있음을 의미합니다. 오늘은 자신의 역할을 책임감 있게 수행하고, 체계적이고 조직적인 접근을 통해 목표를 달성하는 것이 필요할 것입니다. 황제의 에너지를 통해 권위를 발휘하고, 문제를 해결하는 과정에서 주도권을 잡아야 합니다. 강력한 의지와 결단력이 요구되는 날이며, 이를 통해 조직적인 성공을 이끌어낼 수 있을 것입니다. 또한, 자신의 계획을 차근차근 실행해 나가는 것이 중요합니다.''';
      case 5:
        return '''교황 카드는 도덕적 가치와 가르침을 중요시하며, 자신의 신념과 가치를 되새기고 주변 사람들과 영적인 소통을 강화하는 날임을 의미합니다. 오늘은 신앙과 가치관을 바탕으로 중요한 결정을 내리고, 공동체의 지도자로서 역할을 다하는 것이 필요할 수 있습니다. 교황의 에너지는 안정감과 신뢰를 가져다주며, 이를 통해 자신의 믿음을 확립하고, 도덕적 판단을 내리는 데 도움을 줄 것입니다. 또한, 신앙과 가르침이 중요한 역할을 하며, 이를 통해 자신과 타인에게 긍정적인 영향을 미칠 수 있습니다.''';
      case 6:
        return '''연인 카드는 사랑과 관계의 중요성을 강조하며, 오늘은 감정적으로 연결될 기회가 많을 것입니다. 중요한 관계를 강화하고, 사랑과 조화를 이루는 것이 중요하며, 자신의 감정을 솔직하게 표현하는 것이 필요할 수 있습니다. 연인의 에너지는 두 사람 간의 유대감을 깊게 하고, 상호 이해를 통해 긍정적인 관계를 만들어가는 데 도움을 줄 것입니다. 또한, 중요한 선택을 할 때 감정적인 측면을 고려하는 것이 중요하며, 사랑과 조화가 중심이 되는 날입니다.''';
      case 7:
        return '''전차 카드는 승리와 결단력을 상징하며, 도전적인 상황에서도 목표를 향해 나아가는 강한 의지와 집중력이 필요한 날입니다. 오늘은 어려움을 극복하고, 성공적인 결과를 얻을 수 있는 기회가 있을 것입니다. 전차의 에너지를 통해 자신감을 가지고, 목표를 향해 나아가는 것이 중요하며, 도전적인 상황에서 자신의 강한 의지를 발휘해 보세요. 또한, 전투와 도전의 상징이 나타나며, 이를 통해 큰 성취를 이끌어낼 수 있습니다.''';
      case 8:
        return '''힘 카드는 내면의 힘과 인내를 중요시하며, 어려운 상황에서도 자신의 내면을 믿고 극복하는 것이 필요한 날입니다. 오늘은 용기와 인내를 발휘하여 문제를 해결하고, 목표를 달성하는 것이 중요합니다. 힘의 에너지를 통해 자신을 지키고, 내면의 강함을 발휘하며, 어려운 상황을 극복하는 것이 성공의 열쇠가 될 것입니다. 또한, 자신의 힘을 믿고, 적극적으로 문제를 해결해 나가는 것이 필요합니다.''';
      case 9:
        return '''은둔자 카드는 내면의 탐색과 자기 반성을 강조하며, 오늘은 고요한 환경에서 자신을 돌아보고 깊은 통찰력을 얻는 것이 중요할 수 있습니다. 은둔자의 에너지는 고요한 명상과 내면의 진리를 찾는 데 도움을 줄 것입니다. 중요한 결정을 내리기 전에 자신을 돌아보고, 깊이 있는 자기 이해를 통해 방향성을 재정립하는 것이 필요합니다. 또한, 내면의 소리에 귀 기울이며, 자신만의 진리를 찾는 것이 중요합니다.''';
      case 10:
        return '''운명의 수레바퀴 카드는 변화와 순환의 중요성을 강조하며, 오늘은 변화의 흐름에 적응하고 새로운 기회를 받아들이는 것이 필요할 수 있습니다. 수레바퀴의 에너지를 통해 운명의 흐름을 이해하고, 적절히 대응하여 긍정적인 변화를 만들어가는 것이 중요합니다. 변화와 적응이 성공의 열쇠가 될 수 있으며, 이를 통해 새로운 기회를 얻고, 인생의 주기와 흐름을 따라가는 것이 필요합니다.''';
      default:
        return 'Unknown card. Try again.';
    }
  }

  List<String> _getKeywords(int resultNum) {
    switch (resultNum) {
      case 1:
        return ['독착성', '창조성', '상상력', '독립적', '유연함'];
      case 2:
        return ['지혜', '직관', '신비', '내면의 소리', '고요함'];
      case 3:
        return ['풍요', '모성애', '자연', '생명력', '풍성함'];
      case 4:
        return ['권력', '안정성', '구조', '질서', '지배'];
      case 5:
        return ['전통', '가르침', '도덕', '신앙', '영적 지도'];
      case 6:
        return ['사랑', '관계', '선택', '조화', '감정적 유대'];
      case 7:
        return ['승리', '의지', '결단력', '도전', '집중'];
      case 8:
        return ['용기', '인내', '내면의 힘', '자아', '극복'];
      case 9:
        return ['내면 탐색', '자기 반성', '지혜', '고독', '명상'];
      case 10:
        return ['변화', '순환', '운명', '주기', '변동'];
      default:
        return [];
    }
  }
}
