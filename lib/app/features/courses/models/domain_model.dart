// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cs_100/app/features/courses/models/resource_model.dart';

class DomainModel {
  final String name;
  final List<ResourceModel> resources;
  final String thumbnail;
  DomainModel({
    required this.name,
    required this.resources,
    required this.thumbnail,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'resources': resources.map((x) => x.toMap()).toList(),
      'thumbnail': thumbnail,
    };
  }

  factory DomainModel.fromMap(Map<String, dynamic> map) {
    return DomainModel(
      name: map['name'] as String,
      resources: List<ResourceModel>.from(
        (map['resources'] as List<dynamic>).map<ResourceModel>(
          (x) => ResourceModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      thumbnail: map['thumbnail'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DomainModel.fromJson(String source) =>
      DomainModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
