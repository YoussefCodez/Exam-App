import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/exam_entity.dart';

part 'exam_model.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class ExamModel {
  @HiveField(1)
  @JsonKey(name: "_id")
  final String id;

  @HiveField(2)
  @JsonKey(name: "title")
  final String title;

  @HiveField(3)
  @JsonKey(name: "duration")
  final int duration;

  @HiveField(4)
  @JsonKey(name: "subject")
  final String subject;

  @HiveField(5)
  @JsonKey(name: "numberOfQuestions")
  final int numberOfQuestions;

  @HiveField(6)
  @JsonKey(name: "active")
  final bool active;

  @HiveField(7)
  @JsonKey(name: "createdAt")
  final DateTime createdAt;

  ExamModel({
    required this.id,
    required this.title,
    required this.duration,
    required this.subject,
    required this.numberOfQuestions,
    required this.active,
    required this.createdAt,
  });

  factory ExamModel.fromJson(Map<String, dynamic> json) => _$ExamModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExamModelToJson(this);

  ExamEntity toEntity() {
    return ExamEntity(
      id: id,
      title: title,
      duration: duration,
      subject: subject,
      numberOfQuestions: numberOfQuestions,
      active: active,
      createdAt: createdAt,
    );
  }
}
