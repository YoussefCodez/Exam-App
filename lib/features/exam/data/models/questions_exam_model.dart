import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'question_model.dart';
import '../../domain/entities/questions_exam_entity.dart';

part 'questions_exam_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class QuestionsExamModel {
  @HiveField(1)
  @JsonKey(name: "message")
  String message;

  @HiveField(2)
  @JsonKey(name: "questions")
  List<QuestionModel> questions;

  QuestionsExamModel({
    required this.message,
    required this.questions,
  });

  factory QuestionsExamModel.fromJson(Map<String, dynamic> json) => _$QuestionsExamModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsExamModelToJson(this);

  QuestionsExamEntity toEntity() {
    return QuestionsExamEntity(
      message: message,
      questions: questions.map((q) => q.toEntity()).toList(),
    );
  }
}
