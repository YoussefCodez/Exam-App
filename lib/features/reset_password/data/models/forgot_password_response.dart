import 'package:json_annotation/json_annotation.dart';
part 'forgot_password_response.g.dart';
@JsonSerializable()
class ForgotPasswordResponse {
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "info")
    String? info;

    ForgotPasswordResponse({
        this.message,
        this.info,
    });

    factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) => _$ForgotPasswordResponseFromJson(json);

    Map<String, dynamic> toJson() => _$ForgotPasswordResponseToJson(this);
}
