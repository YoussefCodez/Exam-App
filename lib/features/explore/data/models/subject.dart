import 'package:json_annotation/json_annotation.dart';
part 'subject.g.dart';
@JsonSerializable()
class Subject {
  const Subject({this.icon, this.name});

  factory Subject.fromJson(Map<String, dynamic> json) => _$SubjectFromJson(json);

  final String? name;
  final String? icon;

  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}