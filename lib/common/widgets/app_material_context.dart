import 'package:dsd/common/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../settings/widget/inherited_local_notifier.dart';
import '../../settings/widget/inherited_theme_notifier.dart';
import '../../settings/widget/local_controller.dart';
import '../../settings/widget/theme_controller.dart';
import '../localization/app_localizations.dart';
import '../router/app_router.dart';

class AppMaterialContext extends StatefulWidget {
  const AppMaterialContext({super.key});

  @override
  State<AppMaterialContext> createState() => _AppMaterialContextState();
}

class _AppMaterialContextState extends State<AppMaterialContext> {
  final router = const AppRouter();
  final themeController = ThemeController();
  final localController = LocalController();

  @override
  Widget build(BuildContext context) => InheritedThemeNotifier(
        themeController: themeController,
        child: InheritedLocalNotifier(
          localController: localController,
          child: Builder(
            builder: (context) => MaterialApp(
              color: AppColors.c202020,
              debugShowCheckedModeBanner: false,
              title: 'dsd',
              locale: InheritedLocalNotifier.maybeOf(context)?.appLocal ??
                  const Locale('ru', 'RU'),
              theme: themeController.theme,
              supportedLocales: const [
                Locale('uz', 'UZ'),
                Locale('ru', 'RU'),
                Locale('en', 'US')
              ],
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              localeResolutionCallback:
                  (final deviceLocale, final supportedLocales) {
                final local =
                    InheritedLocalNotifier.maybeOf(context, listen: false)!;

                for (final locale in supportedLocales) {
                  if (locale.languageCode == local.appLocal.languageCode) {
                    return local.appLocal;
                  }
                }
                for (final locale in supportedLocales) {
                  if (deviceLocale == locale) {
                    return deviceLocale;
                  }
                }
                local.changeLocal(LangCodes.ru);
                return const Locale('ru', 'RU');
              },
              initialRoute: "/product_details_page",
              onGenerateRoute: router.onGenerateRoute,
              builder: (context, child) => MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: TextScaler.noScaling),
                child: ScrollConfiguration(
                    behavior: const ScrollBehavior(),
                    child: child ?? const Scaffold()),
              ),
            ),
          ),
        ),
      );
}
