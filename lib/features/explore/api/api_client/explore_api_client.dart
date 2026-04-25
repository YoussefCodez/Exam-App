import 'package:dio/dio.dart';
import 'package:exam/core/values/endpoints/endpoints.dart';
import 'package:exam/features/explore/data/models/subjects_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'explore_api_client.g.dart';

@injectable
@RestApi()
abstract class ExploreApiClient {
  @factoryMethod
  factory ExploreApiClient(Dio dio) = _ExploreApiClient;

  @GET(Endpoints.subjects)
  Future<SubjectsResponse> getSubjects(@Header('token') String token);
}

