import 'package:exam/config/di/di.dart';
import 'package:exam/config/dio/token_interceptor.dart';
import 'package:exam/core/app_strings/app_strings.dart';
import 'package:exam/features/exam/presentation/view_models/cubits/get_all_questions_cubit.dart';
import 'package:exam/features/exam/presentation/view_models/states/get_all_questions_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamScreen extends StatelessWidget {
  static const routeName = AppStrings.examRoute;
  const ExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tokenInterceptor = getIt<TokenInterceptor>();
    print(tokenInterceptor.storage.read(key: AppStrings.tokenKey));
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<GetAllQuestionsCubit>()..doEvent(GetAllQuestions()),
        child: BlocBuilder<GetAllQuestionsCubit, GetAllQuestionsState>(
          builder: (context, state) {
            if(state is GetAllQuestionsLoading){
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if(state is GetAllQuestionsSuccess){
              return const Center(
                child: Text('ExamScreen'),
              );
            }else if(state is GetAllQuestionsError){
              return Center(
                child: Text(state.message),
              );
            }
            return const Center(
              child: Text('ExamScreen'),
            );
          },
        ),
      ),
    );
  }
}