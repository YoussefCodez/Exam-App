import 'package:exam/features/login/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "isVerified")
  final bool? isVerified;
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;

  User({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  UserEntity toUserEntity(String token) {
    return UserEntity(
      name: username!,
      email: email!,
      phone: phone!,
      token: token,
    );
  }

  User fromUserEntity(UserEntity userEntity) {
    return User(
      id: id,
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: userEntity.email,
      phone: userEntity.phone,
      role: role,
      isVerified: isVerified,
      createdAt: createdAt,
    );
  }
}
