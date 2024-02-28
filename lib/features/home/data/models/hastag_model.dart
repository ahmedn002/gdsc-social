import 'package:gdsc_social/features/home/domain/entities/hashtag_entity.dart';

class HashTagModel extends HashTagEntity {
  HashTagModel({required super.id, required super.name, required super.count});

  factory HashTagModel.fromJson(Map<String, dynamic> json) {
    return HashTagModel(
      id: json['id'],
      name: json['name'],
      count: json['count'],
    );
  }
}
