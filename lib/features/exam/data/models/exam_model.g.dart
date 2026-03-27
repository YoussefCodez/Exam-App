// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExamModelAdapter extends TypeAdapter<ExamModel> {
  @override
  final typeId = 3;

  @override
  ExamModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExamModel(
      id: fields[1] as String,
      title: fields[2] as String,
      duration: (fields[3] as num).toInt(),
      subject: fields[4] as String,
      numberOfQuestions: (fields[5] as num).toInt(),
      active: fields[6] as bool,
      createdAt: fields[7] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ExamModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.duration)
      ..writeByte(4)
      ..write(obj.subject)
      ..writeByte(5)
      ..write(obj.numberOfQuestions)
      ..writeByte(6)
      ..write(obj.active)
      ..writeByte(7)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExamModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamModel _$ExamModelFromJson(Map<String, dynamic> json) => ExamModel(
  id: json['_id'] as String,
  title: json['title'] as String,
  duration: (json['duration'] as num).toInt(),
  subject: json['subject'] as String,
  numberOfQuestions: (json['numberOfQuestions'] as num).toInt(),
  active: json['active'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$ExamModelToJson(ExamModel instance) => <String, dynamic>{
  '_id': instance.id,
  'title': instance.title,
  'duration': instance.duration,
  'subject': instance.subject,
  'numberOfQuestions': instance.numberOfQuestions,
  'active': instance.active,
  'createdAt': instance.createdAt.toIso8601String(),
};
