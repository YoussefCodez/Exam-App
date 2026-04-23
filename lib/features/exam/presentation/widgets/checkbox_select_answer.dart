import 'package:exam/core/themes/app_colors.dart';
import 'package:exam/features/exam/domain/entities/answer_entity.dart';
import 'package:exam/features/exam/presentation/view_models/cubits/set_multi_user_answer_per_q.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckboxSelectAnswer extends StatelessWidget {
  const CheckboxSelectAnswer({super.key, required this.answers});
  final List<AnswerEntity> answers;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetMultiUserAnswerPerQCubit, List<String>>(
      builder: (context, state) {
        return ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: answers.length,
          separatorBuilder: (context, index) => SizedBox(height: 16.h),
          itemBuilder: (context, index) {
            final isSelected = state.contains(answers[index].key);
            return GestureDetector(
              onTap: () {
                context
                    .read<SetMultiUserAnswerPerQCubit>()
                    .toggleAnswer(answers[index].key);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.blue2 : AppColors.lightBlue2,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: ListTile(
                  title: Text(
                    answers[index].answer,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  trailing: Checkbox(
                    value: isSelected,
                    onChanged: (value) {
                      context
                          .read<SetMultiUserAnswerPerQCubit>()
                          .toggleAnswer(answers[index].key);
                    },
                    fillColor: WidgetStatePropertyAll(AppColors.blue),
                    activeColor: AppColors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
