import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/profile/domain/entities/user_profile.dart';
import 'package:exam/features/profile/domain/repo/profile_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProfileInfoUseCase {
  final ProfileRepoContract repo;
  GetProfileInfoUseCase(this.repo);

  Future<BaseResponse<UserProfile>> call(String token) async {
    
     final response = await repo.getProfile(token);

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
