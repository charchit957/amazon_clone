import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/payment_coniguration.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatefulWidget {
  static const routeName = '/address';
  final String totalAmount;
  const AddressScreen({
    Key? key,
    required this.totalAmount,
  }) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController flatBuildingController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  final _addreessFormKey = GlobalKey<FormState>();
  List<PaymentItem> paymentItems = [];
  String addressToBeUsed = "";
  void onApplePayResult(result) {}
  void onGooglePayResult(result) {}
  void payPressed(String addressFromProvider) {
    addressToBeUsed = "";
    bool isForm = flatBuildingController.text.isNotEmpty ||
        areaController.text.isNotEmpty ||
        pincodeController.text.isNotEmpty ||
        flatBuildingController.text.isNotEmpty;

    if (isForm) {
      if (_addreessFormKey.currentState!.validate()) {
        addressToBeUsed =
            "${flatBuildingController.text}, ${areaController.text}, ${cityController.text} - ${pincodeController.text}";
      } else {
        throw Exception('Please enter all the values!');
      }
    } else if (addressFromProvider.isNotEmpty) {
      addressToBeUsed = addressFromProvider;
    } else {
      showSnackBar(context, 'ERROR');
    }
  }

  @override
  void initState() {
    super.initState();
    paymentItems.add(PaymentItem(
      label: 'Total',
      amount: widget.totalAmount,
      status: PaymentItemStatus.final_price,
    ));
  }

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
    var address = context.watch<UserProvider>().user.address;
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
              ApplePayButton(
                onPressed: () => payPressed(address),
                paymentConfiguration:
                    PaymentConfiguration.fromJsonString(defaultApplePay),
                onPaymentResult: onApplePayResult,
                paymentItems: paymentItems,
                width: double.infinity,
                height: 50,
                style: ApplePayButtonStyle.whiteOutline,
                type: ApplePayButtonType.buy,
                margin: const EdgeInsets.only(top: 15.0),
              ),
              GooglePayButton(
                onPressed: () => payPressed(address),
                paymentConfiguration:
                    PaymentConfiguration.fromJsonString(defaultGooglePay),
                paymentItems: paymentItems,
                width: double.infinity,
                height: 50,
                type: GooglePayButtonType.buy,
                margin: const EdgeInsets.only(top: 15.0),
                onPaymentResult: onGooglePayResult,
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
