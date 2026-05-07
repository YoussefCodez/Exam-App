import 'dart:async';
import 'package:exam/core/app_strings/app_strings.dart';
import 'package:exam/core/themes/app_colors.dart';
import 'package:exam/core/values/app_images/app_images.dart';
import 'package:exam/config/utils/exam_utils.dart';
import 'package:exam/features/exam/domain/entities/question_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

class CountdownScreen extends StatefulWidget {
  final int minutes;
  final List<QuestionEntity> questions;
  final String id;

  const CountdownScreen({
    super.key,
    required this.minutes,
    required this.questions,
    required this.id,
  });

  @override
  State<CountdownScreen> createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen> {
  late DateTime endTime;
  late Duration duration;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    final timerBox = Hive.box('timer');
    final storedEndTime = timerBox.get('endTime');

    if (storedEndTime != null) {
      endTime = DateTime.fromMillisecondsSinceEpoch(storedEndTime);
    } else {
      endTime = DateTime.now().add(Duration(minutes: widget.minutes));
      timerBox.put('endTime', endTime.millisecondsSinceEpoch);
    }

    _calculateRemainingTime();
    timerBox.put('remaining_seconds', duration.inSeconds);
    startTimer();
  }

  void _calculateRemainingTime() {
    final now = DateTime.now();
    if (now.isAfter(endTime)) {
      duration = Duration.zero;
    } else {
      duration = endTime.difference(now);
    }
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _calculateRemainingTime();
      });
      Hive.box('timer').put('remaining_seconds', duration.inSeconds);

      if (duration.inSeconds <= 0) {
        timer?.cancel();
        onTimerFinished();
      }
    });
  }

  Color getColor() {
    final totalSeconds = widget.minutes * 60;
    final remainingSeconds = duration.inSeconds;
    double progress = totalSeconds > 0 ? remainingSeconds / totalSeconds : 0;
    if (progress < 0.5) {
      return AppColors.error;
    }
    return AppColors.green;
  }

  void onTimerFinished() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (contextDialog) => AlertDialog(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImages.timer, width: 45.w, height: 86.h),
                SizedBox(width: 10.w),
                Text(
                  AppStrings.timeIsOut,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.error,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50.h),
                backgroundColor: AppColors.blue,
              ),
              onPressed: () {
                Navigator.pop(context);
                ExamUtils.finishExam(
                  context: context,
                  questions: widget.questions,
                  id: widget.id,
                );
              },
              child: const Text(
                AppStrings.viewScore,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AppImages.clock, width: 40.w, height: 40.h),
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 600),
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
            color: getColor(),
          ),
          child: Text("$minutes:$seconds"),
        ),
        SizedBox(width: 10.w),
      ],
    );
  }
}
