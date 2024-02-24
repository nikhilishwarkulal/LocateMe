import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:locateme/common/theming/app_theme.dart';
import 'package:locateme/common/widgets/app_bar_widget.dart';

void main() {
  testWidgets('Check for title', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: AppBarWidget(
        title: 'testTitle',
      ),
    ));
    await tester.pumpAndSettle();
    // Verify that testTitle is displayed
    expect(find.text('testTitle'), findsOneWidget);
    // Verify that there is 1 SvgPicture
    expect(find.byType(SvgPicture), findsOneWidget);
  });

  testWidgets('Check for title Dark Theme', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: const AppBarWidget(
        title: 'testTitle',
      ),
      theme: AppTheme.dark,
    ));
    await tester.pumpAndSettle();
    // Verify that testTitle is displayed
    expect(find.text('testTitle'), findsOneWidget);
    // Verify that there is 1 SvgPicture
    expect(find.byType(SvgPicture), findsOneWidget);
  });
}
