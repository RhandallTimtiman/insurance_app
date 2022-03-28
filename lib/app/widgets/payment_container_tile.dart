import 'package:flutter/material.dart';
import 'package:insurance_app/app/domain/model/models.dart';

class PaymentContainerTile extends StatelessWidget {
  final ContainerDisplay containerDisplay;
  const PaymentContainerTile({
    Key? key,
    required this.containerDisplay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var containers = containerDisplay.containers ?? [];

    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${containerDisplay.containerSizeName} ${containerDisplay.containerTypeName} x ${containerDisplay.qty}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${containerDisplay.publishedCurrencyCode} ${containerDisplay.totalAmount}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var container in containers)
                  Container(
                    padding: const EdgeInsets.only(left: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(
                          width: 40,
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 10,
                                    height: 10,
                                    color: const Color.fromRGBO(
                                      237,
                                      108,
                                      77,
                                      1,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    container.containerNumber ?? 'N / A',
                                    style: const TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${containerDisplay.publishedCurrencyCode} ${containerDisplay.publishedRateAmount} Per Container'
                                    .toString(),
                                style: const TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                      ],
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
