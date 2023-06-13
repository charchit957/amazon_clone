import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/features/admin/screens/add_product_screen.dart';
import 'package:amazon_clone/features/admin/services/admin_services.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final AdminService adminService = AdminService();
  List<Product>? products;

  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  void fetchProducts() async {
    products = await adminService.fetchAllProducts(context);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Scaffold(
            body: const Center(child: Text('Posts')),
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: FloatingActionButton(
                onPressed: navigateToAddProduct,
                tooltip: 'Add a product',
                child: const Icon(Icons.add),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          );
  }
}
