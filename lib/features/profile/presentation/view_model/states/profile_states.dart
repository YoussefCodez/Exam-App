import 'package:exam/features/profile/domain/entities/user_profile.dart';

sealed class ProfileStates {}

class ProfileInitial extends ProfileStates {}

class ProfileLoading extends ProfileStates {}

class ProfileSuccess extends ProfileStates {
  final UserProfile user;
  ProfileSuccess(this.user);
}

class ProfileError extends ProfileStates {
  final String message;
  ProfileError(this.message);
}
