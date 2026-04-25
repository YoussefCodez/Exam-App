import 'package:dio/dio.dart';
import 'package:exam/features/explore/api/api_client/explore_api_client.dart';
import 'package:exam/features/explore/api/data_sources/mock_data.dart';
import 'package:exam/features/explore/data/models/subject.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import '../../../../config/base_response/base_response.dart';
import '../../../../config/dio/dio_error_handler.dart';
import '../../../../core/app_strings/app_strings.dart';
import '../../data/data_sources/explore_data_sources_contract.dart';

@Injectable(as: ExploreDataSourcesContract)
class ExploreDataSourcesImpl implements ExploreDataSourcesContract{
  ExploreDataSourcesImpl({required this.apiClient, required this.secureStorage});
  final ExploreApiClient apiClient;
  final FlutterSecureStorage secureStorage;

  @override
  Future<BaseResponse<List<Subject>>> getSubjects() async{
    try {
      final tokenValue = await secureStorage.read(
        key: AppStrings.tokenKey,
      );
      print("token: $tokenValue");
      final response = await apiClient.getSubjects(tokenValue ?? "");
      return SuccessBaseResponse(data: response.subjects ?? []);
    } on DioException catch (e) {
      return ErrorBaseResponse(
        message: DioErrorHandler.handle(e),
        code: DioErrorHandler.getStatusCode(e) ?? 404,
      );
    }

  }

}