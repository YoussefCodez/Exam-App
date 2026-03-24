import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/sign_up/data/data_sources/signup_data_sources_remote_contract.dart';
import 'package:exam/features/sign_up/domain/repo/signup_repo_contract.dart';
import 'package:exam/features/sign_up/domain/entities/user.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/user_created.dart';
import '../models/signup_response.dart';

@Injectable(as: SignupRepoContract)
class SignupRepoImpl implements SignupRepoContract {
  final SignupDataSourcesRemoteContract remote;

  SignupRepoImpl(this.remote);

  @override
  Future<BaseResponse<User>> addUser(UserCreated user) async {
    final response = await remote.addUser(user);

    switch (response) {
      case SuccessBaseResponse<SignUpResponse>():
        return SuccessBaseResponse<User>(
          data: response.data.user!.toDomain(),
          message: response.message,
          token: response.token,
        );

      case ErrorBaseResponse<SignUpResponse>():
        return ErrorBaseResponse<User>(
          message: response.message,
          code: response.code,
        );
    }
  }


}