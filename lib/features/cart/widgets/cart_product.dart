// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone/features/cart/services/cart_services.dart';
import 'package:amazon_clone/features/product_details/services/product_detail_services.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProduct extends StatefulWidget {
  final int index;
  const CartProduct({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  final ProductDetailsServices productServices = ProductDetailsServices();
  final CartServices cartServices = CartServices();
  void increaseQuantity(Product product) {
    productServices.addToCart(context: context, product: product);
  }

  void decreaseQuantity(Product product) {
    cartServices.removeFromCart(context: context, product: product);
  }

  @override
  Widget build(BuildContext context) {
    final productCart = Provider.of<UserProvider>(context, listen: true)
        .user
        .cart[widget.index];
    final product = Product.fromMap(productCart['product']);
    final quantity = productCart['quantity'];
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(children: [
            Image.network(
              product.images[0],
              height: 135,
              width: 135,
              fit: BoxFit.contain,
            ),
            Column(
              children: [
                Container(
                  width: 200,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    product.name,
                    style: const TextStyle(fontSize: 16),
                    maxLines: 2,
                  ),
                ),
                Container(
                  width: 200,
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  child: Text(
                    '\$${product.price}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                ),
                Container(
                  width: 200,
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text(
                    'Eligible for FREE shipping',
                  ),
                ),
                Container(
                  width: 200,
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  child: const Text(
                    'In Stock',
                    style: TextStyle(color: Colors.teal),
                  ),
                ),
              ],
            ),
          ]),
        ),
        Container(
          margin: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12, width: 1.5),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black12),
                child: Row(children: [
                  InkWell(
                    onTap: () => decreaseQuantity(product),
                    child: Container(
                      height: 32,
                      width: 35,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.remove,
                        size: 18,
                      ),
                    ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 1.5),
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.white),
                    child: Container(
                      height: 32,
                      width: 35,
                      alignment: Alignment.center,
                      child: Text(
                        quantity.toString(),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => increaseQuantity(product),
                    child: Container(
                      height: 32,
                      width: 35,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.add,
                        size: 18,
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        )
      ],
    );
  }
}
