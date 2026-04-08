import 'package:exam/core/app_colors/app_colors.dart';
import 'package:exam/core/values/explore/subject_screen_titles.dart';
import 'package:flutter/material.dart';

class SubjectScreen extends StatelessWidget {
  static const String routeName = SubjectScreenTitles.routeName;
  const SubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String?>;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          args[SubjectScreenTitles.icon]!,
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(width: 10),
                        Text(
                          args[SubjectScreenTitles.name]!,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),

                    Text(
                      SubjectScreenTitles.thirtyminutes,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(color: AppColors.blue),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      SubjectScreenTitles.twentyQuestions,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(color: AppColors.grey),
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              height: 30,
              thickness: 1,
              color: AppColors.lightBlue.withValues(alpha: 0.1),
            ),
            Row(
              children: [
                Text(
                  SubjectScreenTitles.instructions,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(SubjectScreenTitles.instructionsText),
            ),

            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Start"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
