import 'package:json_annotation/json_annotation.dart';
import 'exam_model.dart';

part 'exams_response_model.g.dart';

@JsonSerializable()
class ExamsResponseModel {
  @JsonKey(name: "message")
  final String? message;
  
  @JsonKey(name: "metadata")
  final ExamsMetadata? metadata;
  
  @JsonKey(name: "exams")
  final List<ExamModel>? exams;

  ExamsResponseModel({
    this.message,
    this.metadata,
    this.exams,
  });

  factory ExamsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ExamsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExamsResponseModelToJson(this);
}

@JsonSerializable()
class ExamsMetadata {
  @JsonKey(name: "currentPage")
  final int? currentPage;
  
  @JsonKey(name: "numberOfPages")
  final int? numberOfPages;
  
  @JsonKey(name: "limit")
  final int? limit;

  ExamsMetadata({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  factory ExamsMetadata.fromJson(Map<String, dynamic> json) =>
      _$ExamsMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$ExamsMetadataToJson(this);
}
