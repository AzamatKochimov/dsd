import 'package:dsd/common/router/route_name.dart';
import 'package:dsd/common/styles/colors.dart';
import 'package:dsd/common/widgets/tab_bar.dart';
import 'package:dsd/feature/auth/presentation/pages/initial/initial_page.dart';
import 'package:dsd/feature/auth/presentation/pages/log_in/log_in_page.dart';
import 'package:dsd/feature/auth/presentation/pages/register/on_complete_page.dart';
import 'package:dsd/feature/auth/presentation/pages/register/register_page.dart';
import 'package:dsd/feature/auth/presentation/pages/register/sms_verification_page.dart';
import 'package:dsd/feature/home/presentation/pages/home_page.dart';
import 'package:dsd/feature/product_details/presentation/pages/product_details_page.dart';
import 'package:dsd/feature/profile/presentation/change_email.dart';
import 'package:dsd/feature/profile/presentation/edit_profile.dart';
import 'package:dsd/feature/profile/presentation/notifications.dart';
import 'package:dsd/feature/profile/presentation/profile_settings.dart';
import 'package:flutter/material.dart';

class AppRouter<T extends Object?> {
  const AppRouter();
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
      case AppRouteName.PRODUCT_DETAILS_PAGE:
        return MaterialPageRoute(
          builder: (ctx) => const ProductDetailsPage(),
        );
      case AppRouteName.INITIAL_PAGE:
        return MaterialPageRoute(builder: (ctx) => const InitialPage());
      case AppRouteName.LOGIN_PAGE:
        return MaterialPageRoute(builder: (ctx) => const LoginPage());
      case AppRouteName.REGISTER_PAGE:
        return MaterialPageRoute(builder: (ctx) => const RegisterPage());
      case AppRouteName.SMS_VERIFICATION_PAGE:
        return MaterialPageRoute(builder: (ctx) => const SMSVerificationPage());
      case AppRouteName.ON_COMPLETE_PAGE:
        return MaterialPageRoute(builder: (ctx) => const OnCompletePage());
      case AppRouteName.HOME_PAGE:
        return MaterialPageRoute(builder: (ctx) => const HomePage());
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
