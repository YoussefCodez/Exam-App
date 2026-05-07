// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exams_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamsResponseModel _$ExamsResponseModelFromJson(Map<String, dynamic> json) =>
    ExamsResponseModel(
      message: json['message'] as String?,
      metadata: json['metadata'] == null
          ? null
          : ExamsMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
      exams: (json['exams'] as List<dynamic>?)
          ?.map((e) => ExamModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExamsResponseModelToJson(ExamsResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'exams': instance.exams,
    };

ExamsMetadata _$ExamsMetadataFromJson(Map<String, dynamic> json) =>
    ExamsMetadata(
      currentPage: (json['currentPage'] as num?)?.toInt(),
      numberOfPages: (json['numberOfPages'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ExamsMetadataToJson(ExamsMetadata instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'numberOfPages': instance.numberOfPages,
      'limit': instance.limit,
    };
