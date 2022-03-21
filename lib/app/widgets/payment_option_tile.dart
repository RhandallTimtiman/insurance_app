import 'package:flutter/material.dart';

class PaymentOptionTile extends StatelessWidget {
  final dynamic paymentOption;
  const PaymentOptionTile({Key? key, required this.paymentOption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 125,
              height: 125,
              child: Material(
                elevation: 10,
                child: Image.network(
                  paymentOption['image'],
                  fit: BoxFit.fill,
                ),
                shadowColor: Colors.white,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    paymentOption['description'].toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
