import 'package:flutter/material.dart';
import 'package:insurance_app/app/domain/model/models.dart';

class ContainerTile extends StatelessWidget {
  final ContainerRate containerRate;
  final bool isNotInsured;

  const ContainerTile({
    Key? key,
    required this.containerRate,
    this.isNotInsured = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            // '20 Dry Container x 1',
            '${containerRate.containerSizeName} ${containerRate.containerTypeName} x ${containerRate.qty}',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          IntrinsicHeight(
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 10,
                  color: const Color.fromRGBO(
                    237,
                    108,
                    77,
                    1,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Fee Per Container',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              !isNotInsured
                                  ? '${containerRate.publishedCurrencyCode} ${containerRate.publishedRateAmount}'
                                  : 'No available rates',
                              style: TextStyle(
                                fontSize: 12,
                                color: !isNotInsured
                                    ? Colors.black
                                    : Colors.redAccent,
                                fontWeight: !isNotInsured
                                    ? FontWeight.normal
                                    : FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Total Fees',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              !isNotInsured
                                  ? '${containerRate.publishedCurrencyCode} ${containerRate.totalAmount}'
                                  : 'No available rates',
                              style: TextStyle(
                                fontSize: 12,
                                color: !isNotInsured
                                    ? Colors.black
                                    : Colors.redAccent,
                                fontWeight: !isNotInsured
                                    ? FontWeight.normal
                                    : FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
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
