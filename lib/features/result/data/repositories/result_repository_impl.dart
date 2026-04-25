import 'dart:convert';
import 'package:exam/features/exam/domain/entities/answer_entity.dart';
import 'package:exam/features/exam/domain/entities/exam_entity.dart';
import 'package:exam/features/exam/domain/entities/question_entity.dart';
import 'package:exam/features/exam/domain/entities/subject_entity.dart';
import 'package:exam/features/result/domain/entities/result_item_entity.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/past_exam_entity.dart';
import '../../domain/repositories/result_repository.dart';

@Singleton(as: ResultRepository)
class ResultRepositoryImpl implements ResultRepository {
  final _boxName = 'past_exams_box';
  
  List<PastExamEntity>? _cachedExams;

  @override
  Future<void> saveExamResult(PastExamEntity exam) async {
    if (!Hive.isBoxOpen(_boxName)) {
      await Hive.openBox(_boxName);
    }
    final box = Hive.box(_boxName);
    final results = await getPastExams();
    results.insert(0, exam);
    _cachedExams = results;
    
    final jsonData = results.map((e) => _entityToMap(e)).toList();
    await box.put('exams_list', jsonEncode(jsonData));
  }

  @override
  Future<List<PastExamEntity>> getPastExams() async {
    if (_cachedExams != null) return List.from(_cachedExams!);

    if (!Hive.isBoxOpen(_boxName)) {
      await Hive.openBox(_boxName);
    }
    final box = Hive.box(_boxName);
    final String? jsonString = box.get('exams_list');
    
    if (jsonString == null) {
      _cachedExams = [];
      return [];
    }

    try {
      final List<dynamic> decodedList = jsonDecode(jsonString);
      _cachedExams = decodedList.map((m) => _mapToEntity(m as Map<String, dynamic>)).toList();
      return List.from(_cachedExams!);
    } catch (e) {
      _cachedExams = [];
      return [];
    }
  }

  Map<String, dynamic> _entityToMap(PastExamEntity exam) {
    return {
      'id': exam.id,
      'examTitle': exam.examTitle,
      'subject': {
        'id': exam.subject.id,
        'name': exam.subject.name,
        'icon': exam.subject.icon,
      },
      'durationMinutes': exam.durationMinutes,
      'totalQuestions': exam.totalQuestions,
      'correctAnswers': exam.correctAnswers,
      'timeTakenMinutes': exam.timeTakenMinutes,
      'createdAt': exam.createdAt.toIso8601String(),
      'results': exam.results.map((r) => {
        'userAnswer': r.userAnswer,
        'question': {
          'id': r.question.id,
          'question': r.question.question,
          'correct': r.question.correct,
          'type': r.question.type,
          'answers': r.question.answers.map((a) => {'key': a.key, 'answer': a.answer}).toList(),
        }
      }).toList(),
    };
  }

  PastExamEntity _mapToEntity(Map<String, dynamic> map) {
    return PastExamEntity(
      id: map['id'],
      examTitle: map['examTitle'],
      subject: _mapToSubject(map['subject']),
      durationMinutes: map['durationMinutes'],
      totalQuestions: map['totalQuestions'],
      correctAnswers: map['correctAnswers'],
      timeTakenMinutes: map['timeTakenMinutes'],
      createdAt: DateTime.parse(map['createdAt']),
      results: (map['results'] as List).map((r) => _mapToResultItem(r)).toList(),
    );
  }

  SubjectEntity _mapToSubject(Map<String, dynamic> map) {
    return SubjectEntity(
      id: map['id'],
      name: map['name'],
      icon: map['icon'],
    );
  }

  ResultItemEntity _mapToResultItem(Map<String, dynamic> map) {
    return ResultItemEntity(
      userAnswer: map['userAnswer'],
      question: _mapToQuestion(map['question']),
    );
  }

  QuestionEntity _mapToQuestion(Map<String, dynamic> map) {
    return QuestionEntity(
      id: map['id'],
      question: map['question'],
      correct: map['correct'],
      type: map['type'],
      answers: (map['answers'] as List).map((a) => AnswerEntity(key: a['key'], answer: a['answer'])).toList(),
      createdAt: DateTime.now(),
      exam: ExamEntity(
        id: '0', 
        title: '', 
        duration: 0, 
        subject: '', 
        numberOfQuestions: 0, 
        active: true, 
        createdAt: DateTime.now()
      ),
    );
  }
}
