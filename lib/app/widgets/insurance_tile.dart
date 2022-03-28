import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance_app/app/domain/controller/controllers.dart';
import 'package:insurance_app/app/domain/model/models.dart';

class InsuranceTile extends StatelessWidget {
  final InsuranceProvider insuranceProvider;

  const InsuranceTile({
    Key? key,
    required this.insuranceProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(
          10,
        ),
        height: 170,
        child: Row(
          children: [
            Material(
              elevation: 10,
              child: Container(
                width: 125,
                color: Colors.blue,
                child: Image.network(
                  'https://cdn4.vectorstock.com/i/1000x1000/26/33/logo-template-for-an-insurance-company-vector-4542633.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            insuranceProvider.name ?? 'N / A',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            insuranceProvider.address ?? 'N / A',
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${insuranceProvider.containerRateList!.containerRates!.isNotEmpty ? insuranceProvider.containerRateList?.containerRates![0].publishedCurrencyCode : 'PHP'} ${insuranceProvider.containerRateList?.totalPublishedAmount}',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.find<InsuranceController>()
                                .setSelectedInsuranceProvider(
                              insuranceProvider,
                            );
                            Get.toNamed('/insurance-details');
                          },
                          child: Container(
                            height: 40,
                            width: 125,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(
                                2,
                                39,
                                108,
                                1,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  15,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Select Provider',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
