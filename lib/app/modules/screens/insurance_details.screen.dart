import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance_app/app/domain/controller/controllers.dart';
import 'package:insurance_app/app/widgets/widgets.dart';

class InsuranceDetailsScreen extends StatefulWidget {
  const InsuranceDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<InsuranceDetailsScreen> createState() => _InsuranceDetailsScreenState();
}

class _InsuranceDetailsScreenState extends State<InsuranceDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GetBuilder<InsuranceController>(
      builder: (_) {
        return Scaffold(
          appBar: const MainAppBar(
            title: Text(
              '',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: const Color.fromRGBO(
            2,
            39,
            108,
            1,
          ),
          body: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                  height: 80,
                  color: const Color.fromRGBO(
                    2,
                    39,
                    108,
                    1,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'Insurance Provider Details',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: size.width,
                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 30,
                    ),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(245, 245, 245, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          70,
                        ),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Material(
                                elevation: 10,
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  color: Colors.blue,
                                  child: Image.network(
                                    'https://cdn4.vectorstock.com/i/1000x1000/26/33/logo-template-for-an-insurance-company-vector-4542633.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _.selectedInsuranceProvider.value.name ??
                                          'N / A',
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      _.selectedInsuranceProvider.value
                                              .address ??
                                          'N / A',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      _.selectedInsuranceProvider.value
                                              .emailAddress ??
                                          'N / A',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Divider(
                            color: Colors.grey[500],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                'Containers',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Card(
                                  child: Container(
                                    padding: const EdgeInsets.all(
                                      20,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        for (var i = 0;
                                            i <
                                                _
                                                    .selectedInsuranceProvider
                                                    .value
                                                    .containerRateList!
                                                    .containerRates!
                                                    .length;
                                            i++)
                                          ContainerTile(
                                            containerRate: _
                                                .selectedInsuranceProvider
                                                .value
                                                .containerRateList!
                                                .containerRates![i],
                                          ),
                                        Divider(
                                          color: Colors.grey[500],
                                        ),
                                        IntrinsicHeight(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              const SizedBox(
                                                width: 30,
                                              ),
                                              const Expanded(
                                                flex: 1,
                                                child: Text(''),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Row(
                                                  children: [
                                                    const Text(
                                                      'Total:',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      '${_.selectedInsuranceProvider.value.containerRateList!.containerRates![0].publishedCurrencyCode} ${_.selectedInsuranceProvider.value.containerRateList!.totalPublishedAmount}',
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: 10,
                                                color: const Color.fromRGBO(
                                                  244,
                                                  190,
                                                  11,
                                                  1,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CheckboxListTile(
                            title: const Text(
                              "I agree with the terms and conditions",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            value: false,
                            onChanged: (newValue) {},
                            controlAffinity: ListTileControlAffinity.leading,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              height: 70,
              width: size.width, //set your width here
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Total: ${_.selectedInsuranceProvider.value.containerRateList!.containerRates![0].publishedCurrencyCode} ${_.selectedInsuranceProvider.value.containerRateList!.totalPublishedAmount}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(
                        2,
                        39,
                        108,
                        1,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(
                          2,
                          39,
                          108,
                          1,
                        ),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    child: Row(
                      children: const [
                        Text(
                          'Pay Now',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                        ),
                      ],
                    ),
                    onPressed: () {
                      Get.toNamed('/payment-summary');
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
