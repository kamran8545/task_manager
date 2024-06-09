import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_app/models/task_model.dart';
import 'package:task_manager_app/presentation/home_screen/view/widgets/text_field_widget.dart';
import 'package:uuid/uuid.dart';

import '../../../../utils/app_colors.dart';
import '../../notifier/home_screen_notifier.dart';

class ShowCreateTaskBottomSheet {
  bool _isCreateNotebookBottomSheetShowing = false;
  final BuildContext context;

  ShowCreateTaskBottomSheet({required this.context}) {
    _isCreateNotebookBottomSheetShowing = true;
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 24.h,
            left: 24.w,
            right: 24.w,
            top: 20.h,
          ),
          child: CreateTaskBottomSheet(
            currentBottomSheet: this,
          ),
        );
      },
    );
  }

  /// Passing build context here because context of this class changes in the nested widget
  void dismissBottomSheet({required BuildContext context}) {
    if (_isCreateNotebookBottomSheetShowing) {
      _isCreateNotebookBottomSheetShowing = false;
      Navigator.of(context).pop();
    }
  }
}

class CreateTaskBottomSheet extends ConsumerWidget {
  final ShowCreateTaskBottomSheet currentBottomSheet;

  CreateTaskBottomSheet({super.key, required this.currentBottomSheet});

  final taskNameTEController = TextEditingController();
  final taskDescriptionTEController = TextEditingController();
  final taskNameFocusNode = FocusNode();
  final taskDescriptionFocusNode = FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var homeController = ref.watch(homeScreenNotifierProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 7.0.h),
          child: TextFieldWidget(
            textEditingController: taskNameTEController,
            focusNode: taskNameFocusNode,
            hintText: 'Task Name',
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.only(top: 7.0.h),
          child: TextFieldWidget(
            textEditingController: taskDescriptionTEController,
            focusNode: taskDescriptionFocusNode,
            hintText: 'Task Description',
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Center(
          child: GestureDetector(
            onTap: () async {
              homeController.addTask(
                taskModel: TaskModel(
                  taskId: const Uuid().v1(),
                  taskName: taskNameTEController.text,
                  taskDescription: taskDescriptionTEController.text,
                ),
              );
              taskNameTEController.text = '';
              taskDescriptionTEController.text = '';
              Navigator.of(context).pop();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.all(Radius.circular(100.r)),
              ),
              child: Text(
                'Create Task',
                style: TextStyle(color: AppColors.whiteColor, fontSize: 15.sp),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
