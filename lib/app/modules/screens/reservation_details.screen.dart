import 'package:flutter/material.dart';
import 'package:insurance_app/app/widgets/widgets.dart';

class ReservationDetailsScreen extends StatefulWidget {
  const ReservationDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ReservationDetailsScreen> createState() =>
      _ReservationDetailsScreenState();
}

class _ReservationDetailsScreenState extends State<ReservationDetailsScreen> {
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
        41,
        50,
        64,
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
                41,
                50,
                64,
                1,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'XLOG-12314',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Status: New',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 30,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      70,
                    ),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        color: Colors.pink,
                        height: 400,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: Colors.pink,
                        height: 400,
                      ),
                      Container(
                        color: Colors.pink,
                        height: 400,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
