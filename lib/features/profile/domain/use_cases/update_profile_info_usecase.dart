import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/profile/domain/entities/user_profile.dart';
import 'package:exam/features/profile/domain/repo/profile_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateProfileInfoUsecase {
  final ProfileRepoContract repo;
  UpdateProfileInfoUsecase(this.repo);

  Future<BaseResponse<UserProfile>> call(String token, String lastName) async {
    
     final response = await repo.updateProfile(token,lastName);

    switch (response) {
      case SuccessBaseResponse<UserProfile>():
        return SuccessBaseResponse<UserProfile>(
          data: response.data,
          message: response.message,
        );

      case ErrorBaseResponse<UserProfile>():
        return ErrorBaseResponse<UserProfile>(
          message: response.message,
          code: response.code,
        );
    }
  }
}
