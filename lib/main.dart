import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:locateme/common/theming/app_theme.dart';
import 'package:locateme/firebase_options.dart';
import 'package:locateme/get_it.dart';
import 'package:provider/provider.dart';

import 'common/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => AppThemeNotifier(),
        builder: (context, _) {
          return MaterialApp(
            title: AppLocalizations.of(context)?.appName ?? "Locate Me",
            navigatorKey: NavigationService.navigatorKey,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            routes: AppRoutes.getRoutes(),
            themeMode: context.watch<AppThemeNotifier>().themeMode,
            initialRoute: AppRoutes.splashScreen,
          );
        });
  }
}

AppLocalizations get appLocalization {
  return AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!;
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
