import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ResourceModel {
  final String domainName;
  final String name;
  final String description;
  final String domainThumbnail;
  final String url;
  ResourceModel({
    required this.domainName,
    required this.name,
    required this.description,
    required this.domainThumbnail,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'domainName': domainName,
      'name': name,
      'description': description,
      'domainThumbnail': domainThumbnail,
      'url': url,
    };
  }

  factory ResourceModel.fromMap(Map<String, dynamic> map) {
    return ResourceModel(
      domainName: map['domainName'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      domainThumbnail: map['domainThumbnail'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResourceModel.fromJson(String source) =>
      ResourceModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
