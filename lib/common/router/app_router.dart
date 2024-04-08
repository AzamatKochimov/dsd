import 'package:dsd/common/router/route_name.dart';
import 'package:dsd/common/widgets/tab_bar.dart';
import 'package:flutter/material.dart';
import '../styles/colors.dart';

class AppRouter<T extends Object?> {
  const AppRouter();

  // ignore: long-method
  Route<T> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.TAB_BAR:
        return MaterialPageRoute(builder: (ctx) => const TabScreen());
      default:
        return _errorRoute();
    }
  }

  Route<T> _errorRoute() => MaterialPageRoute<T>(
        builder: (context) => Scaffold(
          body: Center(
            child: Text(
              'Error Route',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.black,
                  ),
            ),
          ),
        ),
      );
}
