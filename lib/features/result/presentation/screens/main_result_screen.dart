import 'package:exam/core/themes/app_colors.dart';
import 'package:exam/features/result/presentation/widgets/result_exam_card.dart';
import 'package:exam/features/result/presentation/widgets/result_subject_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/di/di.dart';
import '../view_models/result_cubit/result_cubit.dart';
import 'result_screen.dart';

class MainResultScreen extends StatelessWidget {
  static const String routeName = '/main_result';
  const MainResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ResultCubit>()..loadPastExams(),
      child: Scaffold(
        backgroundColor: const Color(0xffF9F9F9),
        appBar: AppBar(
          title: Text(
            "Results",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
        ),
        body: SafeArea(
          child: BlocBuilder<ResultCubit, ResultState>(
            builder: (context, state) {
              if (state is ResultLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ResultError) {
                return Center(child: Text(state.message));
              } else if (state is ResultLoaded) {
                if (state.exams.isEmpty) {
                  return const Center(child: Text("No exams taken yet."));
                }

                // Group by subject conceptually 
                final Widget content = ListView.builder(
                  padding: REdgeInsets.symmetric(horizontal: 20),
                  itemCount: state.exams.length,
                  itemBuilder: (context, index) {
                    final exam = state.exams[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Show header if it's the first item or subject changed
                        if (index == 0 || state.exams[index - 1].subject.name != exam.subject.name)
                          ResultSubjectHeader(title: exam.subject.name),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              ResultScreen.routeName,
                              arguments: exam.results,
                            );
                          },
                          child: ResultExamCard(
                            title: exam.examTitle,
                            questionsCount: exam.totalQuestions,
                            durationMinutes: exam.durationMinutes,
                            correctAnswers: exam.correctAnswers,
                            totalTimeTaken: exam.timeTakenMinutes,
                            icon: Image.network(
                              exam.subject.icon,
                              errorBuilder: (context, error, stackTrace) => const Icon(Icons.menu_book, size: 40),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );

                return content;
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}


