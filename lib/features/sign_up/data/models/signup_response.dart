import 'package:exam/features/sign_up/data/models/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'signup_response.g.dart';
@JsonSerializable()
class SignUpResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "user")
  User? user;

  SignUpResponse({
    this.message,
    this.token,
    this.user,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => _$SignUpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}


