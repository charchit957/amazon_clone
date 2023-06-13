import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/features/account/widgets/single_product.dart';
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
            body: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: products!.length,
              itemBuilder: (context, index) {
                final product = products![index];
                return Column(
                  children: [
                    SizedBox(
                      height: 130,
                      child: SingleProduct(image: product.images[0]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                          product.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        )),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete_outline,
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
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
