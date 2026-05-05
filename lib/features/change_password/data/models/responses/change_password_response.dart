import 'package:exam/core/values/change_password/change_password_titles.dart';
import 'package:json_annotation/json_annotation.dart';
part 'change_password_response.g.dart';
@JsonSerializable()
class ChangePasswordResponse {
    @JsonKey(name: ChangePasswordTitles.message)
    String? message;
    @JsonKey(name: ChangePasswordTitles.token)
    String? token;

    ChangePasswordResponse({
        this.message,
        this.token,
    });

    factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) => _$ChangePasswordResponseFromJson(json);

    Map<String, dynamic> toJson() => _$ChangePasswordResponseToJson(this);
}
