import 'package:flutter/material.dart';
import 'package:insurance_app/app/widgets/widgets.dart';

class PaymentOptionScreen extends StatefulWidget {
  const PaymentOptionScreen({Key? key}) : super(key: key);

  @override
  State<PaymentOptionScreen> createState() => _PaymentOptionScreenState();
}

class _PaymentOptionScreenState extends State<PaymentOptionScreen> {
  List<dynamic> paymentOption = [
    {
      'name': "Union Bank",
      'description': 'Bills Payment',
      'image':
          'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_256,w_256,f_auto,q_auto:eco,dpr_1/v1484228407/ncedex3xyrhssasz89b3.jpg'
    },
    {
      'name': "UPay",
      'description': 'UPay',
      'image': 'https://rainbowpages.lk/uploads/listings/logo/3/31700.jpg'
    },
    {
      'name': "E-Vault",
      'description': 'E-Wallet',
      'image':
          'https://i.channeldailynews.com/wp-content/uploads/2013/08/EvaultWS.png'
    },
    {
      'name': "Manual Payment",
      'description': 'Manual Payment',
      'image':
          'https://images-platform.99static.com//wW3f6iwXZpMVIAeUsuaBjaOr8Cc=/204x0:1184x980/fit-in/590x590/99designs-contests-attachments/66/66392/attachment_66392192'
    }
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 175,
                        width: size.width,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (ctx, index) {
                            return const SizedBox(
                              width: 15,
                            );
                          },
                          shrinkWrap: true,
                          itemCount: paymentOption.length,
                          itemBuilder: (ctx, index) {
                            var paymentDetails = paymentOption[index];
                            return PaymentOptionTile(
                              paymentOption: paymentDetails,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Card(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 150,
                                height: 150,
                                child: Material(
                                  elevation: 10,
                                  child: Image.network(
                                    "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/insurance-company-logo-design-template-c4d9a50f19f47cda2623bab391df4193_screen.jpg?ts=1610149913",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Pay to: MAA General Assurance Phils.',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Outstanding Invoice Amount: -',
                                      style: TextStyle(
                                        fontSize: 11,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Platform Fee: -',
                                      style: TextStyle(
                                        fontSize: 11,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Convenience Fee: -',
                                      style: TextStyle(
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
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
        child: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.white,
          height: 70,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Center(
                child: Text(
                  'Grand Total: PHP 4000.00',
                  style: TextStyle(
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
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
