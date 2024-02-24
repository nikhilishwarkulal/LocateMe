import 'package:flutter/material.dart';
import 'package:locateme/common/app_routes.dart';
import 'package:locateme/common/theming/app_theme.dart';
import 'package:locateme/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final ValueNotifier<bool> shouldFadeIn = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder<bool>(
            valueListenable: shouldFadeIn,
            builder: (context, state, child) {
              return AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: state ? 1 : 0,
                child: RichText(
                  text: TextSpan(
                    text: appLocalization.locate,
                    style: context.theme.appTextStyle.k32Medium.copyWith(
                      color: context.theme.appColors.kPrimary,
                    ),
                    children: [
                      TextSpan(
                        text: appLocalization.me,
                        style: context.theme.appTextStyle.k32Medium.copyWith(
                          color: context.theme.appColors.kSplashTrailingText,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await Future.delayed(const Duration(seconds: 1));
        shouldFadeIn.value = true;
        await Future.delayed(const Duration(seconds: 2));
        if (mounted) {
          Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
        }
      },
    );
  }
}
