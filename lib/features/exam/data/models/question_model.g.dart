// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuestionModelAdapter extends TypeAdapter<QuestionModel> {
  @override
  final typeId = 2;

  @override
  QuestionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuestionModel(
      answers: (fields[1] as List).cast<AnswerModel>(),
      type: fields[3] as String,
      id: fields[5] as String,
      question: fields[7] as String,
      correct: fields[9] as String,
      subject: fields[11] as String?,
      exam: fields[13] as ExamModel,
      createdAt: fields[15] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, QuestionModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(1)
      ..write(obj.answers)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(7)
      ..write(obj.question)
      ..writeByte(9)
      ..write(obj.correct)
      ..writeByte(11)
      ..write(obj.subject)
      ..writeByte(13)
      ..write(obj.exam)
      ..writeByte(15)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    QuestionModel(
      answers: (json['answers'] as List<dynamic>)
          .map((e) => AnswerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String,
      id: json['_id'] as String,
      question: json['question'] as String,
      correct: json['correct'] as String,
      subject: json['subject'] as String?,
      exam: ExamModel.fromJson(json['exam'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$QuestionModelToJson(QuestionModel instance) =>
    <String, dynamic>{
      'answers': instance.answers,
      'type': instance.type,
      '_id': instance.id,
      'question': instance.question,
      'correct': instance.correct,
      'subject': instance.subject,
      'exam': instance.exam,
      'createdAt': instance.createdAt.toIso8601String(),
    };
