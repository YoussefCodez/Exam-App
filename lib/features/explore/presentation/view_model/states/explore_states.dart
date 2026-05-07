import 'package:exam/features/explore/data/models/subject.dart';

sealed class ExploreStates {}

class ExploreInitial extends ExploreStates {}

class ExploreLoading extends ExploreStates {}

class ExploreSuccess extends ExploreStates {
  final List<Subject> data;
  ExploreSuccess(this.data);
}

class ExploreError extends ExploreStates {
  final String message;
  ExploreError(this.message);
}
