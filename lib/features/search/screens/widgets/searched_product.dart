// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone/common/widgets/stars.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/models/product.dart';

class SearchedProduct extends StatelessWidget {
  final Product product;
  const SearchedProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalRating = 0;
    double avgRating = 0;
    for (int i = 0; i < product.ratings!.length; i++) {
      totalRating += product.ratings![i].rating;
    }
    if (totalRating != 0) {
      avgRating = totalRating / product.ratings!.length;
    }
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
                  child: Stars(rating: avgRating),
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
            )
          ]),
        ),
      ],
    );
  }
}
