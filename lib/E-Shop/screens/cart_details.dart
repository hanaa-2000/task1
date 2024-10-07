import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../model/catelog_model.dart';
import '../services/provider_app.dart';
import 'package:pay/pay.dart';

class CartDetails extends StatefulWidget {
  const CartDetails({super.key, this.catalog});

  final Item? catalog;

  @override
  State<CartDetails> createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: "Cart".text.bold.xl4.make(),
            ),
            buildCartWidget(catalog: widget.catalog),
            const Divider(),
            PayListWidget(),
          ],
        ),
      ),
    );
  }

  buildCartWidget({catalog}) {
    final cart = Provider.of<CartModelProvider>(context);

    return cart.items.isEmpty
        ? 'Nothing to show'.text.xl3.makeCentered()
        : Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(
                    Icons.done_outlined,
                  ),
                  trailing: InkWell(
                      onTap: () {
                        cart.remove(cart.items[index]);
                      },
                      child: const Icon(Icons.remove_circle_outlined)),
                  title: cart.items[index].name!.text.make(),
                );
              },
            ),
          );
  }
}

class PayListWidget extends StatelessWidget {
  PayListWidget({super.key});

  final _paymentItems = <PaymentItem>[
    const PaymentItem(
      label: 'Total',
      amount: '10.00', // Specify the amount
      status: PaymentItemStatus.final_price,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModelProvider>(context);
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: '\$${cart.totalPrice}'
                    .text
                    .xl5
                    .color(context.accentColor)
                    .make(),
              ),
              40.widthBox,
              GooglePayButton(
                paymentConfiguration: PaymentConfiguration.fromJsonString(
                    paymentConfigurationString),
                paymentItems: _paymentItems,
                width: 200,
                height: 50,
                theme: GooglePayButtonTheme.dark,
                //style: GooglePayButtonStyle.black,
                type: GooglePayButtonType.pay,
                margin: const EdgeInsets.only(top: 15.0),
                onPaymentResult: (data) {
                  print(data);
                },
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ]),
      ),
    );
  }
}

const String paymentConfigurationString = '''{
  "provider": "google_pay",
  "data": {
    "environment": "TEST",
    "apiVersion": 2,
    "apiVersionMinor": 0,
    "allowedPaymentMethods": [
      {
        "type": "CARD",
        "tokenizationSpecification": {
          "type": "PAYMENT_GATEWAY",
          "parameters": {
            "gateway": "example",
            "gatewayMerchantId": "gatewayMerchantId"
          }
        },
        "parameters": {
          "allowedCardNetworks": ["VISA", "MASTERCARD"],
          "allowedAuthMethods": ["PAN_ONLY", "CRYPTOGRAM_3DS"],
          "billingAddressRequired": true,
          "billingAddressParameters": {
            "format": "FULL",
            "phoneNumberRequired": true
          }
        }
      }
    ],
    "merchantInfo": {
      "merchantId": "01234567890123456789",
      "merchantName": "Example Merchant Name"
    },
    "transactionInfo": {
      "countryCode": "US",
      "currencyCode": "USD"
    }
  }
}''';
