import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager_app/dependency_injection/dependency_injection.dart';
import 'package:task_manager_app/main.dart';
import 'package:task_manager_app/utils/app_constants.dart';

void main() {
  initDependencies();

  testWidgets('Show Create Task Bottom Sheet Test', (widgetTester) async {
    await widgetTester.pumpWidget(const ProviderScope(child: MyApp()));
    var floatingButton = find.byKey(Key(AppConstants.createTaskFloatingButtonKey));
    expect(floatingButton, findsOneWidget);

    await widgetTester.tap(floatingButton);
    await widgetTester.pumpAndSettle();

    var createTaskBottomSheet = find.byKey(Key(AppConstants.createTaskBottomSheetKey));
    expect(createTaskBottomSheet, findsOneWidget);
  });
}
