import 'package:json_annotation/json_annotation.dart';
import 'subject.dart';

part 'subjects_response.g.dart';

@JsonSerializable()
class SubjectsResponse {
  final String? message;
  final Metadata? metadata;
  final List<Subject>? subjects;

  SubjectsResponse({this.message, this.metadata, this.subjects});

  factory SubjectsResponse.fromJson(Map<String, dynamic> json) =>
      _$SubjectsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectsResponseToJson(this);
}

@JsonSerializable()
class Metadata {
  final int? currentPage;
  final int? numberOfPages;
  final int? limit;

  Metadata({this.currentPage, this.numberOfPages, this.limit});

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
