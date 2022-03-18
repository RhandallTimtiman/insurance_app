import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance_app/app/modules/screens/screens.dart';

class InsuranceTile extends StatelessWidget {
  final String image;
  final String tag;
  final String name;

  const InsuranceTile({
    Key? key,
    this.image = '',
    this.tag = '',
    this.name = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(
          10,
        ),
        height: 125,
        child: Row(
          children: [
            Hero(
              tag: tag,
              child: Material(
                elevation: 10,
                child: Container(
                  width: 125,
                  color: Colors.blue,
                  child: Image.network(
                    image,
                    fit: BoxFit.fill,
                  ),
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
                            name,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Balikbayan Road Tanay, Rizal',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Total Price: PHP 123',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(
                              () => InsuranceDetailsScreen(
                                tag: tag,
                                image: image,
                              ),
                            );
                          },
                          child: Container(
                            height: 40,
                            width: 125,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(
                                41,
                                50,
                                64,
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
