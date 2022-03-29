import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance_app/app/domain/controller/controllers.dart';
import 'package:insurance_app/app/domain/model/models.dart';
import 'package:shimmer/shimmer.dart';

class PaymentOptionTile extends StatelessWidget {
  final PaymentProvider paymentProvider;

  const PaymentOptionTile({
    Key? key,
    required this.paymentProvider,
  }) : super(key: key);

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
                          width: 2,
                          color: Color.fromRGBO(
                            2,
                            39,
                            108,
                            1,
                          ),
                        ),
                        bottom: BorderSide(
                          width: 2,
                          color: Color.fromRGBO(
                            2,
                            39,
                            108,
                            1,
                          ),
                        ),
                        left: BorderSide(
                          width: 2,
                          color: Color.fromRGBO(
                            2,
                            39,
                            108,
                            1,
                          ),
                        ),
                        right: BorderSide(
                          width: 2,
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
                  : 128,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: _.selectedProvider.value.productGuid ==
                            paymentProvider.productGuid
                        ? 130
                        : 128,
                    height: _.selectedProvider.value.productGuid ==
                            paymentProvider.productGuid
                        ? 130
                        : 128,
                    child: CachedNetworkImage(
                      imageUrl: paymentProvider.productImageUrl.toString(),
                      fit: BoxFit.contain,
                      placeholder: (context, url) => Shimmer.fromColors(
                        child: const SizedBox(
                          height: 80,
                          width: 80,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        baseColor: const Color(0xFFE0E0E0),
                        enabled: true,
                        highlightColor: const Color(0xFFF5F5F5),
                        period: const Duration(milliseconds: 1000),
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        size: 50,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                  const Divider(
                    height: 2,
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
