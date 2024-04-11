import 'package:dsd/common/router/route_name.dart';
import 'package:dsd/common/widgets/tab_bar.dart';
import 'package:dsd/feature/profile/presentation/change_email.dart';
import 'package:dsd/feature/profile/presentation/edit_profile.dart';
import 'package:dsd/feature/profile/presentation/notifications.dart';
import 'package:dsd/feature/profile/presentation/profile_settings.dart';
import 'package:flutter/material.dart';
import '../styles/colors.dart';

class AppRouter<T extends Object?> {
  const AppRouter();

  // ignore: long-method
  Route<T> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.TAB_BAR:
        return MaterialPageRoute(
          builder: (ctx) => const TabScreen(),
        );
      case AppRouteName.EDIT_PROFILE:
        return MaterialPageRoute(
          builder: (ctx) => const EditProfile(),
        );
      case AppRouteName.NOTIFICATIONS:
        return MaterialPageRoute(
          builder: (ctx) => const Notifications(),
        );
      case AppRouteName.PROFILE_SETTINGS:
        return MaterialPageRoute(
          builder: (ctx) => const ProfileSettings(),
        );
      case AppRouteName.CHANGE_EMAIL:
        return MaterialPageRoute(
          builder: (ctx) => const ChangeEmail(),
        );
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
