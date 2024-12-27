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
        contentKr: json['contentKr'],
        img: json['img'],
        date: json['date'] ?? 'Dep 2024.12',
        link: json['link']);
  }
}
