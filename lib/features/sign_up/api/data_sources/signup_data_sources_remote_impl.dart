import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/sign_up/api/signup_api_client/signup_api_client.dart';
import 'package:exam/features/sign_up/data/data_sources/signup_data_sources_remote_contract.dart';
import 'package:exam/features/sign_up/data/models/signup_response.dart';

import '../../data/models/user.dart';

class SignupDataSourcesRemoteImpl extends SignupDataSourcesRemoteContract{
  SignupApiClient apiClient;
  SignupDataSourcesRemoteImpl(this.apiClient);

  @override
  Future<BaseResponse<SignUpResponse>> addUser() async {
    try{
      final response = await apiClient.addUser();
      return SuccessBaseResponse<SignUpResponse>(data: response);
    }
    catch(e){
      return ErrorBaseResponse<SignUpResponse>(message: e.toString(), code: 0);
    }

  }
}