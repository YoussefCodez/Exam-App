// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_exam_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuestionsExamModelAdapter extends TypeAdapter<QuestionsExamModel> {
  @override
  final typeId = 1;

  @override
  QuestionsExamModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuestionsExamModel(
      message: fields[1] as String,
      questions: (fields[2] as List).cast<QuestionModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, QuestionsExamModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.questions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionsExamModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionsExamModel _$QuestionsExamModelFromJson(Map<String, dynamic> json) =>
    QuestionsExamModel(
      message: json['message'] as String,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionsExamModelToJson(QuestionsExamModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'questions': instance.questions,
    };
