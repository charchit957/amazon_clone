import 'package:amazon_clone/features/home/widgets/address_box.dart';
import 'package:amazon_clone/features/home/widgets/carousel_image.dart';
import 'package:amazon_clone/features/home/widgets/deal_of_day.dart';
import 'package:amazon_clone/features/home/widgets/top_categories.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
      body: const SingleChildScrollView(
        child: Column(
          children: [
            AddressBox(),
            SizedBox(
              height: 10,
            ),
            TopCategories(),
            SizedBox(
              height: 10,
            ),
            CarouselImage(),
            SizedBox(
              height: 10,
            ),
            DealOfDay(),
          ],
        ),
      ),
    );
  }
}
