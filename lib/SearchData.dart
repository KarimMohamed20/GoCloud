class SearchData {
  final title;
  final name;

  SearchData({this.title,this.name});

  factory SearchData.fromJson(Map<String, dynamic> json) {
    return new SearchData(
      title: json['title'],
      name: json['name']
    );
  }
}