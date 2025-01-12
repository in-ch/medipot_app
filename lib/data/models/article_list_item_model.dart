import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;

class ArticleListItem {
  final int no;
  final String titleKr;
  final String contentKr;
  final String img;
  final String date;
  final String link;

  ArticleListItem({
    required this.no,
    required this.titleKr,
    required this.img,
    required this.contentKr,
    required this.date,
    required this.link,
  });

  factory ArticleListItem.fromJson(Map<String, dynamic> json) {
    return ArticleListItem(
      no: json['no'],
      titleKr: json['titleKr'],
      img: json['img'],
      contentKr: _removeUnwantedTags(json['contentKr']),
      date: json['date'] ?? 'Dep 2024.12',
      link: json['link'],
    );
  }

  static String _removeUnwantedTags(String htmlContent) {
    dom.Document document = parse(htmlContent);
    document.querySelectorAll('div.article__footer').forEach((element) {
      element.remove();
    });
    document.querySelectorAll('div.top-pick').forEach((element) {
      element.remove();
    });
    return document.body?.outerHtml ?? '';
  }
}
