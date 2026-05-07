sealed class GetAllQuestionsEvent {}

class GetAllQuestions extends GetAllQuestionsEvent {
  final String id;
  GetAllQuestions({required this.id});
}