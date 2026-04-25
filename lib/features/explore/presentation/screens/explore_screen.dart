import 'package:exam/core/colors/app_colors.dart';
import 'package:exam/core/values/explore/explore_screen_titles.dart';
import 'package:exam/features/explore/presentation/screens/subject_screen.dart';
import 'package:exam/features/explore/presentation/view_model/cubit/explore_view_model.dart';
import 'package:exam/features/explore/presentation/view_model/states/explore_states.dart';
import 'package:exam/features/explore/presentation/widgets/subject_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/di/di.dart';
import '../view_model/states/explore_events.dart';

class ExploreScreen extends StatefulWidget {
  static const String routeName = ExploreScreenTitles.routeName;
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final ExploreViewModel viewModel = getIt.get<ExploreViewModel>();
  @override
  void initState() {
    viewModel.doEvent(event: GetSubjectsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ExploreScreenTitles.survey,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.blue,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: SearchBar(
              elevation: WidgetStatePropertyAll(0.0),
              backgroundColor: WidgetStatePropertyAll(AppColors.white),
              side: WidgetStatePropertyAll(
                BorderSide(color: AppColors.black, width: 1),
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              hintText: ExploreScreenTitles.search,
              hintStyle: WidgetStatePropertyAll(
                TextStyle(color: AppColors.grey),
              ),
              leading: Icon(Icons.search, color: AppColors.grey),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              ExploreScreenTitles.browse,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),

          BlocProvider(
            create: (context) => viewModel,
            child: BlocBuilder<ExploreViewModel, ExploreStates>(
              builder: (context, state) {
                if (state is ExploreLoading) {
                  return Center(
                    child: CircularProgressIndicator(color: AppColors.blue),
                  );
                } else if (state is ExploreSuccess) {
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => InkWell(
                        child: SubjectContainer(
                          name: state.data[index].name!,
                          icon: state.data[index].icon!,
                        ),
                        onTap: () => Navigator.pushNamed(
                          context,
                          SubjectScreen.routeName,
                          arguments: {
                            "name": state.data[index].name,
                            "icon": state.data[index].icon,
                            "id": state.data[index].id
                          },
                        ),
                      ),
                      itemCount: state.data.length,
                    ),
                  );
                } else if (state is ExploreError) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.message)));
                  });
                }
                return Center(
                  child: CircularProgressIndicator(color: AppColors.red),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
