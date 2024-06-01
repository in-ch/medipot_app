import 'dart:convert';

// Keyword 클래스 정의
class KeywordRank {
  String keyword;
  String upDown;

  KeywordRank({required this.keyword, required this.upDown});

  factory KeywordRank.fromJson(Map<String, dynamic> json) {
    return KeywordRank(
      keyword: json['keyword'],
      upDown: json['upDown'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'keyword': keyword,
      'upDown': upDown,
    };
  }
}

// KeywordRankResponse 클래스 정의
class KeywordRankResponse {
  int no;
  DateTime createdAt;
  DateTime updatedAt;
  List<KeywordRank> keywordList;

  KeywordRankResponse({
    required this.no,
    required this.createdAt,
    required this.updatedAt,
    required this.keywordList,
  });

  factory KeywordRankResponse.fromJson(Map<String, dynamic> json) {
    var keywordListFromJson = jsonDecode(json['keywordList']) as List;
    List<KeywordRank> keywordList =
        keywordListFromJson.map((i) => KeywordRank.fromJson(i)).toList();

    return KeywordRankResponse(
      no: json['no'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      keywordList: keywordList,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> keywordListToJson =
        keywordList.map((i) => i.toJson()).toList();

    return {
      'no': no,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'keywordList': jsonEncode(keywordListToJson),
    };
  }
}
