import 'package:dio/dio.dart';
import 'package:exam/core/values/endpoints/endpoints.dart';
import 'package:exam/core/values/profile/profile_data_source_map.dart';
import 'package:exam/features/profile/data/models/profile_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_api_client.g.dart';

@lazySingleton
@RestApi()
abstract class ProfileApiClient {
  @factoryMethod
  factory ProfileApiClient(Dio dio) = _ProfileApiClient;

  @GET(Endpoints.getLoggedUserInfo)
  Future<ProfileResponse> getLoggedUserInfo(@Header(ProfileDataSourceMap.token) String token);

  @PUT(Endpoints.editProfileUrl)
  Future<ProfileResponse> updateLoggedUserInfo(
    @Header(ProfileDataSourceMap.token) String token,
    @Body() Map<String, dynamic> body,
  );
}
