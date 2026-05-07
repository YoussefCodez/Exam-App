import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../../data/models/subject.dart';
import '../repo/explore_repo_contract.dart';

@injectable
class GetSubjectsUseCase {
  GetSubjectsUseCase({required this.repoContract});
  final ExploreRepoContract repoContract;

  Future<BaseResponse<List<Subject>>> call() async =>
  repoContract.fetchSubjects();
}

