import 'package:amazon_clone/features/admin/screens/add_product_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/home/screens/category_deals._screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'common/widgets/bottom_bar.dart';
import 'features/home/screens/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(builder: (context) => const AuthScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case BottomBar.routeName:
      return MaterialPageRoute(builder: (context) => const BottomBar());
    case AddProductScreen.routeName:
      return MaterialPageRoute(builder: (context) => const AddProductScreen());
    case CategoryDealScreen.routeName:
      var category = settings.arguments as String;
      return MaterialPageRoute(
          builder: (context) => CategoryDealScreen(
                category: category,
              ));

    default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold(
                body: Center(child: Text('Screen doesn\'t exist!')),
              ));
  }
}
