class ArticleListItem {
  // final int no;
  final String titleKr;
  final String contentKr;
  final String img;

  ArticleListItem({
    // required this.no,
    required this.titleKr,
    required this.img,
    required this.contentKr,
  });

  factory ArticleListItem.fromJson(Map<String, dynamic> json) {
    return ArticleListItem(
      // no: json['no'],
      titleKr: json['titleKr'],
      contentKr: json['contentKr'],
      img: json['img'],
    );
  }
}
