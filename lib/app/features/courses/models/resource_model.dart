import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ResourceModel {
  final String domainName;
  final String name;
  final String description;
  final String domainThumbnail;
  ResourceModel({
    required this.domainName,
    required this.name,
    required this.description,
    required this.domainThumbnail,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'domainName': domainName,
      'name': name,
      'description': description,
      'domainThumbnail': domainThumbnail,
    };
  }

  factory ResourceModel.fromMap(Map<String, dynamic> map) {
    return ResourceModel(
      domainName: map['domainName'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      domainThumbnail: map['domainThumbnail'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResourceModel.fromJson(String source) =>
      ResourceModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
