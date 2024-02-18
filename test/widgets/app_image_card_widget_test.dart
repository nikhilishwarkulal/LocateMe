import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:locateme/common/widgets/app_image_card_widget.dart';
import 'package:locateme/modules/home/view_model/location_view_model.dart';

void main() {
  testWidgets('Check for title and svgpicture', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: AppImageCardWidget(
        onTap: () {},
        locationViewModel: const LocationViewModel(
          url: "url",
          rating: 2,
          title: "titleerror",
          lat: 23,
          long: 23,
        ),
      ),
    ));
    await tester.pumpAndSettle();
    // Verify that there is titleerror widget
    expect(find.text('titleerror'), findsOneWidget);
    // There should be 5 SvgPicture as there is 5 stars
    expect(find.byType(SvgPicture), findsNWidgets(0));
  });
}
