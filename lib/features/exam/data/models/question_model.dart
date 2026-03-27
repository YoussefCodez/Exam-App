import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'answer_model.dart';
import 'exam_model.dart';
import '../../domain/entities/question_entity.dart';

part 'question_model.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class QuestionModel {
  @HiveField(1)
  @JsonKey(name: "answers")
  final List<AnswerModel> answers;

  @HiveField(3)
  @JsonKey(name: "type")
  final String type;

  @HiveField(5)
  @JsonKey(name: "_id")
  final String id;

  @HiveField(7)
  @JsonKey(name: "question")
  final String question;

  @HiveField(9)
  @JsonKey(name: "correct")
  final String correct;

  @HiveField(11)
  @JsonKey(name: "subject")
  final String? subject;

  @HiveField(13)
  @JsonKey(name: "exam")
  final ExamModel exam;

  @HiveField(15)
  @JsonKey(name: "createdAt")
  final DateTime createdAt;

  QuestionModel({
    required this.answers,
    required this.type,
    required this.id,
    required this.question,
    required this.correct,
    this.subject,
    required this.exam,
    required this.createdAt,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) => _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);

  QuestionEntity toEntity() {
    return QuestionEntity(
      answers: answers.map((a) => a.toEntity()).toList(),
      type: type,
      id: id,
      question: question,
      correct: correct,
      subject: subject,
      exam: exam.toEntity(),
      createdAt: createdAt,
    );
  }
}