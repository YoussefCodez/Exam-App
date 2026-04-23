import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/answer_entity.dart';

part 'answer_model.g.dart';

@HiveType(typeId: 4)
@JsonSerializable()
class AnswerModel {
  @HiveField(1)
  @JsonKey(name: "answer")
  final String answer;

  @HiveField(2)
  @JsonKey(name: "key")
  final String key;

  AnswerModel({
    required this.answer,
    required this.key,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) => _$AnswerModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerModelToJson(this);

  AnswerEntity toEntity() {
    return AnswerEntity(
      answer: answer,
      key: key,
    );
  }
}
