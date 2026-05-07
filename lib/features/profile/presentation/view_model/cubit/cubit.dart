import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/profile/domain/entities/user_profile.dart';
import 'package:exam/features/profile/domain/use_cases/get_profile_info_usecase.dart';
import 'package:exam/features/profile/domain/use_cases/update_profile_info_usecase.dart';
import 'package:exam/features/profile/presentation/view_model/states/profile_events.dart';
import 'package:exam/features/profile/presentation/view_model/states/profile_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileStates> {
  final GetProfileInfoUseCase _callProfileUsecase;
  final UpdateProfileInfoUsecase _callUpdateProfileUsecase;

  ProfileViewModel(this._callProfileUsecase, this._callUpdateProfileUsecase)
    : super(ProfileInitial());

  void doEvent(ProfileEvents event, String token, UserProfile user) async {
    switch (event) {
      case GetUserProfileInfoEvent():
        await _getProfileInfo(token: token);

      case UpdateUserProfileInfoEvent():
        await _updateProfile(token: token, user: user);
    }
  }

  Future<void> _getProfileInfo({required String token}) async {
    emit(ProfileLoading());

    final response = await _callProfileUsecase.call(token);

    switch (response) {
      case SuccessBaseResponse<UserProfile>():
        emit(ProfileSuccess(response.data ?? UserProfile()));

      case ErrorBaseResponse<UserProfile>():
        emit(ProfileError(response.message));
    }
  }

  Future<void> _updateProfile({
    required String token,
    required UserProfile user,
  }) async {
    emit(ProfileLoading());
    final response = await _callUpdateProfileUsecase.call(token, user);

    switch (response) {
      case SuccessBaseResponse<UserProfile>():
        emit(ProfileSuccess(response.data ?? UserProfile()));

      case ErrorBaseResponse<UserProfile>():
        emit(ProfileError(response.message));
    }
  }
}
