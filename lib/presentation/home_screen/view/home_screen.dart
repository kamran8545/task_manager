import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_app/models/task_model.dart';
import 'package:task_manager_app/presentation/home_screen/view/widgets/create_task_bottomsheet.dart';
import 'package:task_manager_app/presentation/home_screen/view/widgets/task_widget.dart';

import '../../../utils/app_colors.dart';
import '../notifier/home_screen_notifier.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var homeController = ref.watch(homeScreenNotifierProvider);
    return Scaffold(
      backgroundColor: AppColors.mainBGColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 0,
        title: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Text(
            "Tasks",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.mainColor,
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: homeController.isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.mainColor,
                ),
              )
            : homeController.tasks.isNotEmpty
                ? ListView(
                    shrinkWrap: true,
                    children: [
                      for (TaskModel taskModel in homeController.tasks) TaskWidget(taskModel: taskModel),
                    ],
                  )
                : const Center(
                    child: Text("No Tasks Found!"),
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainColor,
        child: const Icon(
          Icons.add,
          color: AppColors.whiteColor,
        ),
        onPressed: () {
          ShowCreateTaskBottomSheet(context: context);
        },
      ),
    );
  }
}
