import 'package:exam/features/exam/domain/entities/subject_entity.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subject_model.g.dart';

@HiveType(typeId: 5)
@JsonSerializable()
class SubjectModel {
  @HiveField(1)
  @JsonKey(name: "_id")
  final String id;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String icon;

  SubjectModel({required this.id, required this.name, required this.icon});
  factory SubjectModel.fromJson(Map<String, dynamic> json) => _$SubjectModelFromJson(json);

  SubjectEntity toEntity() {
    return SubjectEntity(id: id, name: name, icon: icon);
  }
}
