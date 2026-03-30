import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:exam/features/exam/data/models/answer_model.dart';
import 'package:exam/features/exam/data/models/exam_model.dart';
import 'package:exam/features/exam/data/models/question_model.dart';
import 'package:exam/features/exam/data/models/questions_exam_model.dart';

class HiveSetup {
  static Future<void> init() async {
    await Hive.initFlutter();
    
    // Register Adapters
    Hive.registerAdapter(QuestionsExamModelAdapter());
    Hive.registerAdapter(QuestionModelAdapter());
    Hive.registerAdapter(ExamModelAdapter());
    Hive.registerAdapter(AnswerModelAdapter());
    
    // Open Boxes
    await Hive.openBox<QuestionsExamModel>('exam_box');
  }
}
