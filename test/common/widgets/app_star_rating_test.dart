import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:locateme/common/widgets/app_star_rating.dart';

void main() {
  testWidgets('Check for Star rating widget', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: AppStarRating(
        star: 5,
      ),
    ));
    await tester.pumpAndSettle();
    // There should be 5 SvgPicture as there is 5 stars
    expect(find.byType(SvgPicture), findsNWidgets(5));
  });
}
