import 'package:exam/core/app_strings/app_strings.dart';
import 'package:exam/core/themes/app_colors.dart';
import 'package:exam/features/result/domain/entities/result_item_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultScreen extends StatelessWidget {
  static const String routeName = '/result';

  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final results =
        ModalRoute.of(context)!.settings.arguments as List<ResultItemEntity>? ??
        [];

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.answers, style: TextStyle(fontSize: 24.sp)),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: AppColors.black),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppStrings.homeRoute,
              (route) => false,
              arguments: 1, 
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          final result = results[index];
          return Padding(
            padding: REdgeInsets.all(16),
            child: Container(
              width: double.infinity,
              padding: REdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${index + 1}. ${result.question.question}",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  ...result.question.answers.map((answer) {
                    bool isUserAnswer = answer.key == result.userAnswer;
                    bool isCorrectAnswer =
                        answer.key == result.question.correct;
                    bool isFilled =
                        isCorrectAnswer || (isUserAnswer && !isCorrectAnswer);

                    Color radioColor;
                    if (isCorrectAnswer) {
                      radioColor = AppColors.success;
                    } else if (isUserAnswer) {
                      radioColor = AppColors.error;
                    } else {
                      radioColor = AppColors.blue;
                    }

                    return Container(
                      margin: EdgeInsets.only(bottom: 12.h),
                      padding: REdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: isCorrectAnswer
                            ? AppColors.success.withValues(alpha: 0.2)
                            : (isUserAnswer
                                  ? AppColors.error.withValues(alpha: 0.2)
                                  : AppColors.lightBlue2.withValues(
                                      alpha: 0.5,
                                    )),
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: isCorrectAnswer
                              ? AppColors.success
                              : (isUserAnswer
                                    ? AppColors.error
                                    : Colors.transparent),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 24.w,
                            height: 24.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: radioColor, width: 2.w),
                            ),
                            child: isFilled
                                ? Center(
                                    child: Container(
                                      width: 12.w,
                                      height: 12.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: radioColor,
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Text(
                              answer.answer,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
