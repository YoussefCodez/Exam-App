import 'package:exam/core/values/sign_up/signup_resoponses_titles.dart';
import 'package:exam/features/sign_up/data/models/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'signup_response.g.dart';
@JsonSerializable()
class SignUpResponse {
  @JsonKey(name: SignupResoponsesTitles.message)
  String? message;
  @JsonKey(name: SignupResoponsesTitles.token)
  String? token;
  @JsonKey(name: SignupResoponsesTitles.user)
  User? user;

  SignUpResponse({
    this.message,
    this.token,
    this.user,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => _$SignUpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}


