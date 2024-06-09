import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager_app/dependency_injection/dependency_injection.dart';
import 'package:task_manager_app/main.dart';
import 'package:task_manager_app/utils/app_constants.dart';

void main() {
  initDependencies();

  testWidgets('Home Screen Body Test', (widgetTester) async {
    await widgetTester.pumpWidget(const ProviderScope(child: MyApp()));
    var homeScreenBody = find.byKey(Key(AppConstants.createTaskFloatingButtonKey));
    expect(homeScreenBody, findsOneWidget);
  });
}
