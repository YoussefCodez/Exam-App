import 'package:json_annotation/json_annotation.dart';

part 'subject.g.dart';

@JsonSerializable()
class Subject {
  const Subject({this.id, this.icon, this.name, this.createdAt});

  factory Subject.fromJson(Map<String, dynamic> json) => _$SubjectFromJson(json);

  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? icon;
  final String? createdAt;

  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}