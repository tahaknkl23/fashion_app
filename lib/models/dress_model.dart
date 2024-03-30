// ignore_for_file: public_member_api_docs, sort_constructors_first

class DressModel {
  final String description;
  final String imageUrl;
  final int price;
  final String title;
  final String type;

  DressModel({
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.title,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'title': title,
      'type': type,
    };
  }

  factory DressModel.fromMap(Map<String, dynamic> map) {
    return DressModel(
      description: map['description'] as String,
      imageUrl: map['imageUrl'] as String,
      price: map['price'] as int,
      title: map['title'] as String,
      type: map['type'] as String,
    );
  }
}
