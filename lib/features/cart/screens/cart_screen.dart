import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/cart/widgets/cart_product.dart';
import 'package:amazon_clone/features/cart/widgets/cart_subtotal.dart';
import 'package:amazon_clone/features/home/widgets/address_box.dart';
import 'package:amazon_clone/features/search/screens/search_screen.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              child: Container(
                height: 42,
                margin: const EdgeInsets.only(left: 15),
                child: Material(
                    elevation: 1,
                    borderRadius: BorderRadius.circular(7),
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
                      decoration: const InputDecoration(
                          prefixIcon: InkWell(
                            child: Padding(
                              padding: EdgeInsets.only(left: 6),
                              child: Icon(
                                Icons.search,
                                size: 23,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.only(top: 10),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                              borderSide: BorderSide.none),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                              borderSide:
                                  BorderSide(color: Colors.black38, width: 1)),
                          hintText: 'Search Amazon.in',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17)),
                    )),
              ),
            ),
            Container(
                height: 42,
                color: Colors.transparent,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(
                  Icons.mic,
                  color: Colors.black,
                  size: 25,
                ))
          ]),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const AddressBox(),
          const CartSubtotal(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              text: 'Proceed to Buy (${user.cart.length} items)',
              color: Colors.yellow[600],
              onTap: () {},
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            height: 10,
            thickness: 1,
            color: Colors.black12.withOpacity(0.08),
          ),
          const SizedBox(
            height: 5,
          ),
          ListView.builder(
            itemCount: user.cart.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CartProduct(
                index: index,
              );
            },
          )
        ]),
      ),
    );
  }
}