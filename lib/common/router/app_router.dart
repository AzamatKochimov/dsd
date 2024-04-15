import 'package:dsd/common/router/route_name.dart';
import 'package:dsd/common/widgets/tab_bar.dart';
import 'package:dsd/feature/crud/presentation/pages/add_item_home_page.dart';
import 'package:dsd/feature/crud/presentation/pages/create_part/create_product_main_page.dart';
import 'package:flutter/material.dart';
import '../../feature/crud/presentation/pages/active_products_page.dart';
import '../../feature/crud/presentation/pages/draft_products_page.dart';
import '../styles/colors.dart';

class AppRouter<T extends Object?> {
  const AppRouter();

  // ignore: long-method
  Route<T> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.TAB_BAR:
        return MaterialPageRoute(builder: (ctx) => const TabScreen());
      case AppRouteName.ADDITEMHOMEPAGE:
        return MaterialPageRoute(builder: (ctx) => const AddItemHomePage());
      case AppRouteName.DRAFTPRODUCTSPAGE:
        return MaterialPageRoute(builder: (ctx) => const DraftProductsPage());
      case AppRouteName.ACTIVEPRODUCTSPAGE:
        return MaterialPageRoute(builder: (ctx) => const ActiveProductsPage());
      case AppRouteName.CREATEPRODUCTMAINPAGE:
        return MaterialPageRoute(builder: (ctx) => const CreateProductMainPage());
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
