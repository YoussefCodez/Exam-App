import 'package:exam/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class SubjectContainer extends StatelessWidget {
  const SubjectContainer({super.key, required this.name, required this.icon});
  final String name;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Row(
              children: [
                Image.network(icon, height: 50, width: 50),
                SizedBox(width: 10),
                Text(name, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
