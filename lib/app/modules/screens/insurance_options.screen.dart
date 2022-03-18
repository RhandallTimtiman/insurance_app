import 'package:flutter/material.dart';
import 'package:insurance_app/app/widgets/widgets.dart';

class InsuranceOptionsScreen extends StatefulWidget {
  const InsuranceOptionsScreen({Key? key}) : super(key: key);

  @override
  State<InsuranceOptionsScreen> createState() => _InsuranceOptionsScreenState();
}

class _InsuranceOptionsScreenState extends State<InsuranceOptionsScreen> {
  List<dynamic> options = [
    {
      "name": "MAA Insurance Corp",
      "tag": "tag-maa-hero",
      "image":
          "https://cdn4.vectorstock.com/i/1000x1000/26/33/logo-template-for-an-insurance-company-vector-4542633.jpg",
    },
    {
      "name": "Dall Insurance Corp",
      "tag": "tag-dall-hero",
      "image":
          "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/insurance-company-logo-design-template-c4d9a50f19f47cda2623bab391df4193_screen.jpg?ts=1610149913",
    },
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
                    'Insurance Options',
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
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return InsuranceTile(
                      image: options[index]["image"],
                      tag: options[index]["tag"],
                      name: options[index]["name"],
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return const SizedBox(
                      height: 5,
                    );
                  },
                  itemCount: options.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
