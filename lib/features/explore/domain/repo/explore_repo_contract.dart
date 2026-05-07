import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/explore/data/models/subject.dart';

abstract class ExploreRepoContract {

  Future<BaseResponse<List<Subject>>> fetchSubjects();
}