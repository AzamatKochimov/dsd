import 'package:dsd/common/router/route_name.dart';
import 'package:dsd/common/styles/colors.dart';
import 'package:dsd/common/widgets/custom_text_widget.dart';
import 'package:dsd/feature/auth/view_model/auth_vm.dart';
import 'package:dsd/feature/crud/presentation/widgets/general_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../view_model/add_item_vm.dart';
import '../widgets/custom_nav_bar_item.dart';
import 'active_products_page.dart';
import 'draft_products_page.dart';

List<Widget> pages = [
  const ActiveProductsPage(),
  const DraftProductsPage(),
];

class AddItemHomePage extends ConsumerWidget {
  const AddItemHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<bool>(
        future: ref.read(loginref).isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: CustomTextWidget(text: 'Oops, smth went wrong'),
            );
          } else if (snapshot.data == true) {
            //! it should be replaced later
            return const LoggedInUI();
            // return const NotLoggedInUi();

          } else {
            return const NotLoggedInUi();
            // return const LoggedInUI();
            
          }
        });
  }
}

class LoggedInUI extends StatelessWidget {
  const LoggedInUI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.black,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        // backgroundColor: AppColors.black,
        leading: const CustomArrowBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          children: [
            const CustomAppNavBar(navBarLabels: ['active products', 'draft']),
            Expanded(
              child: Consumer(
                builder: (cntx, ref, child) {
                  final currentPageIndex =
                      ref.watch(currentTabBarPageIndexCrudProvider);
                  return IndexedStack(
                    index: currentPageIndex,
                    children: pages,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotLoggedInUi extends StatelessWidget {
  const NotLoggedInUi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomTextWidget(
                text: 'Login or Register to add or control your ads',
                textColor: Colors.grey,
              ),
              spaceWidget(isHeight: true, size: 30),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                minWidth: double.infinity,
                height: 60,
                color: AppColors.c57C5B6,
                onPressed: () {
                  Navigator.pushNamed(context, AppRouteName.LOGIN_PAGE);
                },
                child: const CustomTextWidget(
                  text: 'Login or Register',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



/* Custom Icon Button Widget, App Bar da ishlatsa boladi, oldingi page otqizib beradi */
class CustomArrowBackButton extends StatelessWidget {
  const CustomArrowBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back),
      color: Colors.white,
    );
  }
}
