// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnswerModelAdapter extends TypeAdapter<AnswerModel> {
  @override
  final typeId = 4;

  @override
  AnswerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnswerModel(answer: fields[1] as String, key: fields[2] as String);
  }

  @override
  void write(BinaryWriter writer, AnswerModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.answer)
      ..writeByte(2)
      ..write(obj.key);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnswerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerModel _$AnswerModelFromJson(Map<String, dynamic> json) =>
    AnswerModel(answer: json['answer'] as String, key: json['key'] as String);

Map<String, dynamic> _$AnswerModelToJson(AnswerModel instance) =>
    <String, dynamic>{'answer': instance.answer, 'key': instance.key};
