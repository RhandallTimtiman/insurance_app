import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance_app/app/domain/controller/controllers.dart';
import 'package:insurance_app/app/domain/model/models.dart';

class PaymentOptionTile extends StatelessWidget {
  final PaymentProvider paymentProvider;

  const PaymentOptionTile({Key? key, required this.paymentProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
      builder: (_) {
        return GestureDetector(
          onTap: () {
            _.setSelectedPaymentProvider(paymentProvider);
          },
          child: Card(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: _.selectedProvider.value.productGuid ==
                        paymentProvider.productGuid
                    ? const Border(
                        top: BorderSide(
                          width: 5,
                          color: Color.fromRGBO(
                            2,
                            39,
                            108,
                            1,
                          ),
                        ),
                        bottom: BorderSide(
                          width: 5,
                          color: Color.fromRGBO(
                            2,
                            39,
                            108,
                            1,
                          ),
                        ),
                        left: BorderSide(
                          width: 5,
                          color: Color.fromRGBO(
                            2,
                            39,
                            108,
                            1,
                          ),
                        ),
                        right: BorderSide(
                          width: 5,
                          color: Color.fromRGBO(
                            2,
                            39,
                            108,
                            1,
                          ),
                        ),
                      )
                    : null,
              ),
              width: _.selectedProvider.value.productGuid ==
                      paymentProvider.productGuid
                  ? 130
                  : 125,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: _.selectedProvider.value.productGuid ==
                            paymentProvider.productGuid
                        ? 130
                        : 125,
                    height: _.selectedProvider.value.productGuid ==
                            paymentProvider.productGuid
                        ? 130
                        : 125,
                    child: Material(
                      elevation: 10,
                      child: Image.network(
                        'https://rainbowpages.lk/uploads/listings/logo/3/31700.jpg',
                        fit: BoxFit.fill,
                      ),
                      shadowColor: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            paymentProvider.productName ?? 'N / A',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
