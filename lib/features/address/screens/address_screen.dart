import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatefulWidget {
  static const routeName = '/address';
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController flatBuildingController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  final _addreessFormKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    flatBuildingController.dispose();
    areaController.dispose();
    cityController.dispose();
    pincodeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var address = context.watch<UserProvider>().user.address;
    var address = 'Bhinder,Udaipur';
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (address.isNotEmpty)
                Column(children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        address,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'OR',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ]),
              Form(
                key: _addreessFormKey,
                child: Column(children: [
                  CustomTextField(
                    controller: flatBuildingController,
                    hintText: 'Flat, House no., Building',
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: areaController,
                    hintText: 'Area, Stret',
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: pincodeController,
                    hintText: 'Pincode',
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: cityController,
                    hintText: 'Town/City',
                  ),
                  const SizedBox(height: 10),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
