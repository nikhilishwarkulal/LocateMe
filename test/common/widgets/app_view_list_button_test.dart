import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:locateme/common/widgets/app_view_list_button.dart';
import 'package:locateme/main.dart';

void main() {
  testWidgets('Check for AppViewListButton testing',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      navigatorKey: NavigationService.navigatorKey,
      supportedLocales: AppLocalizations.supportedLocales,
      home: AppViewListButton(
        onTap: () {},
      ),
    ));
    await tester.pumpAndSettle();
    // Verify that there is title error widget
    expect(find.text("View List"), findsOneWidget);
    // There should be 5 SvgPicture as there is 5 stars
    expect(find.byType(SvgPicture), findsNWidgets(1));
  });
}
