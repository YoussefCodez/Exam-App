import 'package:exam/core/values/reset_responses.dart';
import 'package:json_annotation/json_annotation.dart';
part 'verify_reset_response.g.dart';

@JsonSerializable()
class VerifyResetResponse {
  @JsonKey(name: ResetResponses.status)
  String? status;

  VerifyResetResponse({this.status});

  factory VerifyResetResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyResetResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyResetResponseToJson(this);
}
