import 'package:exam/core/themes/app_colors.dart';
import 'package:exam/features/exam/domain/entities/answer_entity.dart';
import 'package:exam/features/exam/presentation/view_models/cubits/set_user_answer_per_q.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RadioSelectAnswer extends StatelessWidget {
  const RadioSelectAnswer({super.key, required this.answers});
  final List<AnswerEntity> answers;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetUserAnswerPerQCubit, String>(
      builder: (context, state) {
        return RadioGroup(
          groupValue: state,
          onChanged: (value) {
            context.read<SetUserAnswerPerQCubit>().setUserAnswer(value!);
          },
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: answers.length,
            separatorBuilder: (context, index) {
              return SizedBox(height: 16.h);
            },
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: state == answers[index].key
                      ? AppColors.blue2
                      : AppColors.lightBlue2,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: ListTile(
                  title: Text(
                    answers[index].answer,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  leading: Radio(
                    toggleable: true,
                    value: answers[index].key,
                    fillColor: WidgetStatePropertyAll(AppColors.blue),
                    activeColor: AppColors.blue,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
