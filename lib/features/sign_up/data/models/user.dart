import 'package:exam/core/values/sign_up/signup_user_titles.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:exam/features/sign_up/domain/entities/user.dart' as entity;
part 'user.g.dart';
@JsonSerializable()
class User {
  @JsonKey(name: SignupUserTitles.username)
  String? username;
  @JsonKey(name: SignupUserTitles.firstName)
  String? firstName;
  @JsonKey(name: SignupUserTitles.lastName)
  String? lastName;
  @JsonKey(name: SignupUserTitles.email)
  String? email;
  @JsonKey(name: SignupUserTitles.phone)
  String? phone;
  @JsonKey(name: SignupUserTitles.role)
  String? role;
  @JsonKey(name: SignupUserTitles.isVerified)
  bool? isVerified;
  @JsonKey(name: SignupUserTitles.id)
  String? id;
  @JsonKey(name: SignupUserTitles.createdAt)
  DateTime? createdAt;

  User({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.id,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  entity.User toDomain() {
    return entity.User(
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      role: role,
      isVerified: isVerified,
      id: id,
      createdAt: createdAt,
    );
  }
}