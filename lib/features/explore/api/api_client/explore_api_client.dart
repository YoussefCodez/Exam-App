import 'package:dio/dio.dart';
import 'package:exam/features/explore/data/models/subject.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'explore_api_client.g.dart';

@injectable
@RestApi()
abstract class ExploreApiClient {
  @factoryMethod
  factory ExploreApiClient(Dio dio) = _ExploreApiClient;

  @GET('/subjects')
  Future<List<Subject>> getSubjects(@Header('token') String token);
}

