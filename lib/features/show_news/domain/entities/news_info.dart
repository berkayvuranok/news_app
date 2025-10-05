class NewsInfo {
  final String? title;
  final String? author;
  final String? imageUrl;
  final DateTime dateTime;
  final String? content;

  const NewsInfo({
    this.title,
    this.content,
    required this.dateTime,
    this.author,
    this.imageUrl,
  });
}