// ignore_for_file: public_member_api_docs, sort_constructors_first
class LiveStream {
  final String name;
  final String type;
  final String image;
  final int viewers;

  LiveStream({
    required this.name,
    required this.type,
    required this.image,
    required this.viewers,
  });

  factory LiveStream.fromJson(Map<String, dynamic> json) {
    return LiveStream(
      name: json['name'],
      type: json['type'],
      image: json['image'],
      viewers: json['viewers'],
    );
  }
}
