import 'package:exam/config/base_response/base_response.dart';

import 'package:exam/features/explore/data/models/subject.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo/explore_repo_contract.dart';
import '../data_sources/explore_data_sources_contract.dart';

@Injectable(as: ExploreRepoContract)
class ExploreRepoImpl implements ExploreRepoContract{
  final ExploreDataSourcesContract dataSourcesContract;
  ExploreRepoImpl(this.dataSourcesContract);

  @override
  Future<BaseResponse<List<Subject>>> fetchSubjects() async{
    final response = await dataSourcesContract.getSubjects();
    switch(response){
      case SuccessBaseResponse<List<Subject>>():
        return SuccessBaseResponse(data: response.data);
      case ErrorBaseResponse<List<Subject>>():
        return ErrorBaseResponse(message: response.message, code: response.code);

    }
  }
}