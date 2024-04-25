import 'package:dsd/common/router/route_name.dart';
import 'package:dsd/common/styles/colors.dart';
import 'package:dsd/common/widgets/bottom_tab_bar.dart';
import 'package:dsd/feature/crud/presentation/pages/add_item_home_page.dart';
import 'package:dsd/feature/crud/presentation/pages/create_part/categories/create_childs_product.dart';
import 'package:dsd/feature/crud/presentation/pages/create_part/categories/create_real_estate.dart';
import 'package:dsd/feature/crud/presentation/pages/create_part/choose_subcategory.dart';
import 'package:flutter/material.dart';
import '../../feature/crud/presentation/pages/active_products_page.dart';
import '../../feature/crud/presentation/pages/create_part/choose_category_main_page.dart';
import '../../feature/crud/presentation/pages/draft_products_page.dart';
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

class AppRouter<T extends Object?> {
  const AppRouter();

  Route<T> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.TAB_BAR:
        return MaterialPageRoute(
            builder: (ctx) => const TabScreen(), settings: settings);
      case AppRouteName.ADDITEMHOMEPAGE:
        return MaterialPageRoute(
            builder: (ctx) => const AddItemHomePage(), settings: settings);
      case AppRouteName.DRAFTPRODUCTSPAGE:
        return MaterialPageRoute(
            builder: (ctx) => const DraftProductsPage(), settings: settings);
      case AppRouteName.ACTIVEPRODUCTSPAGE:
        return MaterialPageRoute(
            builder: (ctx) => const ActiveProductsPage(), settings: settings);
      case AppRouteName.CHILDREN_PRODUCT_PAGE:
        return MaterialPageRoute(
            builder: (ctx) => const CreateChildrenProduct(),
            settings: settings);
      case AppRouteName.REAL_ESTATE_PAGE:
        return MaterialPageRoute(
            builder: (ctx) => const TabScreen(), settings: settings);

      // CRUD FOLDER PAGES
      case AppRouteName.ADDITEMHOMEPAGE:
        return MaterialPageRoute(
            builder: (ctx) => const AddItemHomePage(), settings: settings);
      case AppRouteName.DRAFTPRODUCTSPAGE:
        return MaterialPageRoute(
            builder: (ctx) => const DraftProductsPage(), settings: settings);
      case AppRouteName.ACTIVEPRODUCTSPAGE:
        return MaterialPageRoute(
            builder: (ctx) => const ActiveProductsPage(), settings: settings);
      case AppRouteName.CREATEPRODUCTMAINPAGE:
        return MaterialPageRoute(
            builder: (ctx) => const CreateChildrenProduct(),
            settings: settings);
      case AppRouteName.CHOOSECATEGORYMAINPAGE:
        return MaterialPageRoute(
            builder: (ctx) => const ChooseCategoryMainPage(),
            settings: settings);
      case AppRouteName.CHOOSESUBCATEGORY:
        return MaterialPageRoute(
            builder: (ctx) => const ChooseSubcategory(), settings: settings);
      case AppRouteName.EDIT_PROFILE:
        return MaterialPageRoute(
            builder: (ctx) => const EditProfile(), settings: settings);
      case AppRouteName.NOTIFICATIONS:
        return MaterialPageRoute(
            builder: (ctx) => const Notifications(), settings: settings);
      case AppRouteName.PROFILE_SETTINGS:
        return MaterialPageRoute(
            builder: (ctx) => const ProfileSettings(), settings: settings);
      case AppRouteName.CHANGE_EMAIL:
        return MaterialPageRoute(
            builder: (ctx) => const ChangeEmail(), settings: settings);
      case AppRouteName.PRODUCT_DETAILS_PAGE:
        return MaterialPageRoute(
            builder: (ctx) => const ProductDetailsPage(), settings: settings);
      case AppRouteName.INITIAL_PAGE:
        return MaterialPageRoute(
            builder: (ctx) => const InitialPage(), settings: settings);
      case AppRouteName.LOGIN_PAGE:
        return MaterialPageRoute(
            builder: (ctx) => const LoginPage(), settings: settings);
      case AppRouteName.REGISTER_PAGE:
        return MaterialPageRoute(
            builder: (ctx) => const RegisterPage(), settings: settings);
      case AppRouteName.SMS_VERIFICATION_PAGE:
        return MaterialPageRoute(
            builder: (ctx) => const SMSVerificationPage(), settings: settings);
      case AppRouteName.ON_COMPLETE_PAGE:
        return MaterialPageRoute(
            builder: (ctx) => const OnCompletePage(), settings: settings);
      case AppRouteName.HOME_PAGE:
        return MaterialPageRoute(
            builder: (ctx) => const HomePage(), settings: settings);
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
