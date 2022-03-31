import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance_app/app/domain/controller/controllers.dart';
import 'package:insurance_app/app/domain/model/models.dart';
import 'package:insurance_app/app/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

class PaymentOptionScreen extends StatefulWidget {
  const PaymentOptionScreen({Key? key}) : super(key: key);

  @override
  State<PaymentOptionScreen> createState() => _PaymentOptionScreenState();
}

class _PaymentOptionScreenState extends State<PaymentOptionScreen>
    with WidgetsBindingObserver {
  final PaymentController _paymentController = Get.find();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _paymentController.getPaymentProviders();
    });
  }

  @override
  void dispose() {
    _paymentController.setSelectedPaymentProvider(PaymentProvider());
    _paymentController.setShowDetails(false);
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      Get.close(4);
      Get.find<ReservationDetailsController>().getReservationDetails();
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<PaymentController>(
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
                        'Payment Option',
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
                      vertical: 24,
                      horizontal: 24,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                      ),
                      color: Color.fromRGBO(245, 245, 245, 1),
                    ),
                    child: !_.isLoading.value
                        ? SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 175,
                                  width: size.width,
                                  child: Center(
                                    child: ListView.separated(
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (ctx, index) {
                                        return const SizedBox(
                                          width: 15,
                                        );
                                      },
                                      shrinkWrap: true,
                                      itemCount: _.paymentProviders.length,
                                      itemBuilder: (ctx, index) {
                                        return PaymentOptionTile(
                                          paymentProvider:
                                              _.paymentProviders[index],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                _.showDetails.value
                                    ? Card(
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SizedBox(
                                                width: 150,
                                                height: 150,
                                                child: Material(
                                                  elevation: 10,
                                                  child: CachedNetworkImage(
                                                    imageUrl: _.selectedProvider
                                                        .value.productImageUrl
                                                        .toString(),
                                                    fit: BoxFit.contain,
                                                    placeholder:
                                                        (context, url) =>
                                                            Shimmer.fromColors(
                                                      child: const SizedBox(
                                                        height: 80,
                                                        width: 80,
                                                        child: DecoratedBox(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                                      baseColor: const Color(
                                                          0xFFE0E0E0),
                                                      enabled: true,
                                                      highlightColor:
                                                          const Color(
                                                              0xFFF5F5F5),
                                                      period: const Duration(
                                                          milliseconds: 1000),
                                                    ),
                                                    errorWidget: (
                                                      context,
                                                      url,
                                                      error,
                                                    ) =>
                                                        Image.asset(
                                                      'assets/images/noAvailCompanyImage.png',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Pay to: ${Get.find<InsuranceController>().selectedInsuranceProvider.value.name}',
                                                      style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    const Text(
                                                      'Outstanding Invoice Amount:',
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 2,
                                                    ),
                                                    Text(
                                                      '${Get.find<InsuranceController>().selectedInsuranceProvider.value.currencyCode} ${_.computedRates.value.invoiceAmount}',
                                                      style: const TextStyle(
                                                        fontSize: 11,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 7,
                                                    ),
                                                    const Text(
                                                      'Platform Fee:',
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 2,
                                                    ),
                                                    Text(
                                                      '${Get.find<InsuranceController>().selectedInsuranceProvider.value.currencyCode} ${_.computedRates.value.platformFee}',
                                                      style: const TextStyle(
                                                        fontSize: 11,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 7,
                                                    ),
                                                    const Text(
                                                      'Convenience Fee:',
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                      ),
                                                    ),
                                                    Text(
                                                      '${Get.find<InsuranceController>().selectedInsuranceProvider.value.currencyCode} ${_.computedRates.value.convenienceFee}',
                                                      style: const TextStyle(
                                                        fontSize: 11,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                              ],
                            ),
                          )
                        : Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                CircularProgressIndicator(
                                  strokeWidth: 7.0,
                                  backgroundColor: const Color.fromRGBO(
                                    2,
                                    39,
                                    108,
                                    1,
                                  ),
                                  color: const Color.fromRGBO(
                                    237,
                                    108,
                                    77,
                                    1,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Fetching Payment Providers...",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: _.showDetails.value
                ? Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.white,
                    height: 70,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Text(
                            'Grand Total: ${Get.find<InsuranceController>().selectedInsuranceProvider.value.currencyCode} ${_.computedRates.value.grandTotalAmount}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(
                                2,
                                39,
                                108,
                                1,
                              ),
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
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
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
                            _.submitPayment();
                          },
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
