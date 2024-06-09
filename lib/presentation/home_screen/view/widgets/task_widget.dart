import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_app/models/task_model.dart';

import '../../../../utils/app_colors.dart';
import '../../notifier/home_screen_notifier.dart';

class TaskWidget extends ConsumerWidget {
  final TaskModel taskModel;

  const TaskWidget({super.key, required this.taskModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var homeController = ref.watch(homeScreenNotifierProvider);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      margin: EdgeInsets.symmetric(vertical: 5.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.mainColor.withOpacity(0.2),
        border: Border.all(width: 1.h, color: AppColors.mainColor),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.list_alt,
            color: AppColors.blackColor,
          ),
          SizedBox(
            width: 5.w,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                taskModel.taskName,
                style: TextStyle(color: AppColors.blackColor, fontSize: 15.sp),
              ),
              Text(
                taskModel.taskDescription,
                style: TextStyle(color: AppColors.blackColor.withOpacity(0.7), fontSize: 13.sp),
              )
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              homeController.deleteTask(taskId: taskModel.taskId);
            },
            icon: const Icon(
              Icons.delete,
              color: AppColors.redColor,
            ),
          ),
        ],
      ),
    );
  }
}
