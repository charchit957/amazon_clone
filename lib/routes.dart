import 'package:amazon_clone/features/address/screens/address_screen.dart';
import 'package:amazon_clone/features/admin/screens/add_product_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/home/screens/category_deals._screen.dart';
import 'package:amazon_clone/features/order_details.dart/screens/order_details_screen.dart';
import 'package:amazon_clone/models/order.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

import 'common/widgets/bottom_bar.dart';
import 'features/home/screens/home_screen.dart';
import 'features/product_details/screens/product_detail_screen.dart';
import 'features/search/screens/search_screen.dart';

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
    case SearchScreen.routeName:
      var searchQuery = settings.arguments as String;
      return MaterialPageRoute(
          builder: (context) => SearchScreen(
                searchQuery: searchQuery,
              ));
    case ProductDetailScreen.routeName:
      var product = settings.arguments as Product;
      return MaterialPageRoute(
          builder: (context) => ProductDetailScreen(
                product: product,
              ));
    case AddressScreen.routeName:
      var totalAmount = settings.arguments as String;
      return MaterialPageRoute(
          builder: (context) => AddressScreen(
                totalAmount: totalAmount,
              ));

    case OrderDetailsScreen.routeName:
      var order = settings.arguments as Order;
      return MaterialPageRoute(
          builder: (context) => OrderDetailsScreen(
                order: order,
              ));
    default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold(
                body: Center(child: Text('Screen doesn\'t exist!')),
              ));
  }
}
