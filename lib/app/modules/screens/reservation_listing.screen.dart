import 'package:flutter/material.dart';
import 'package:insurance_app/app/widgets/widgets.dart';

class ReservationListingScreen extends StatefulWidget {
  const ReservationListingScreen({Key? key}) : super(key: key);

  @override
  State<ReservationListingScreen> createState() =>
      _ReservationListingScreenState();
}

class _ReservationListingScreenState extends State<ReservationListingScreen> {
  List<dynamic> reservations = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(
          41,
          50,
          64,
          1,
        ),
        title: const Text(
          'Reservation List',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        color: Colors.grey[100],
        child: ListView.separated(
          separatorBuilder: (ctx, index) {
            return const SizedBox(
              height: 15,
            );
          },
          shrinkWrap: true,
          itemCount: reservations.length,
          itemBuilder: (ctx, index) {
            return const ReservationCard();
          },
        ),
      ),
    );
  }
}
