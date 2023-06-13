import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, top: 15),
          child: const Text(
            'Deal of the Day',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Image.network(
          'https://th.bing.com/th/id/OIP.uj21rdWJCNqZDaOXrlqAZwHaGX?pid=ImgDet&rs=1',
          height: 235,
          fit: BoxFit.fitHeight,
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15),
          child: const Text('\$ 1,299.00',
              style: TextStyle(
                fontSize: 20,
              )),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
          child: const Text(
            'MacBook',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                'https://th.bing.com/th/id/OIP.uj21rdWJCNqZDaOXrlqAZwHaGX?pid=ImgDet&rs=1',
                height: 100,
                width: 100,
                fit: BoxFit.fitWidth,
              ),
              Image.network(
                'https://th.bing.com/th/id/OIP.uj21rdWJCNqZDaOXrlqAZwHaGX?pid=ImgDet&rs=1',
                height: 100,
                width: 100,
                fit: BoxFit.fitWidth,
              ),
              Image.network(
                'https://th.bing.com/th/id/OIP.uj21rdWJCNqZDaOXrlqAZwHaGX?pid=ImgDet&rs=1',
                height: 100,
                width: 100,
                fit: BoxFit.fitWidth,
              ),
              Image.network(
                'https://th.bing.com/th/id/OIP.uj21rdWJCNqZDaOXrlqAZwHaGX?pid=ImgDet&rs=1',
                height: 100,
                width: 100,
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15).copyWith(left: 15),
          alignment: Alignment.topLeft,
          child: Text(
            'See all deals',
            style: TextStyle(color: Colors.cyan[800]),
          ),
        ),
      ],
    );
  }
}
