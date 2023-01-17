import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Course {
  final String id;
  final String name;
  final String thumbnail;
  Course({
    required this.id,
    required this.name,
    required this.thumbnail,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'thumbnail': thumbnail,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      id: map['id'] as String,
      name: map['name'] as String,
      thumbnail: map['thumbnail'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) =>
      Course.fromMap(json.decode(source) as Map<String, dynamic>);
}
