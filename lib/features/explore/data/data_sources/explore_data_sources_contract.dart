import 'package:exam/features/explore/data/models/subject.dart';
import '../../../../config/base_response/base_response.dart';

abstract class ExploreDataSourcesContract {
  Future<BaseResponse<List<Subject>>> getSubjects();
}