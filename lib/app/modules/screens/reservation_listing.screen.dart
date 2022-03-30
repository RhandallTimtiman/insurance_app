import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance_app/app/domain/controller/controllers.dart';
import 'package:insurance_app/app/widgets/widgets.dart';

class ReservationListingScreen extends StatefulWidget {
  const ReservationListingScreen({Key? key}) : super(key: key);

  @override
  State<ReservationListingScreen> createState() =>
      _ReservationListingScreenState();
}

class _ReservationListingScreenState extends State<ReservationListingScreen> {
  List<dynamic> reservations = [1, 2, 3];

  final ReservationController _reservationController = Get.find();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _reservationController.getListOfReservation();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const MainAppBar(
        title: Text(
          'Reservation List',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        color: Colors.grey[100],
        child: GetBuilder<ReservationController>(
          builder: (_) {
            if (_.isLoading.value) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    CircularProgressIndicator(
                      strokeWidth: 7.0,
                      backgroundColor: Color.fromRGBO(
                        244,
                        162,
                        64,
                        1,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Fetching Reservations...",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            }
            return RefreshIndicator(
              onRefresh: () => _.pullToRefresh(),
              child: ListView.separated(
                separatorBuilder: (ctx, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                shrinkWrap: true,
                itemCount: _.reservations.length,
                itemBuilder: (ctx, index) {
                  if (index == _.reservations.length - 1) {
                    return Column(
                      children: [
                        ReservationCard(
                          reservation: _.reservations[index],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: ElevatedButton(
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                !_.isNextPageLoading.value
                                    ? const Text(
                                        'Load More',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      )
                                    : const CircularProgressIndicator(
                                        strokeWidth: 7.0,
                                        backgroundColor: Color.fromRGBO(
                                          244,
                                          162,
                                          64,
                                          1,
                                        ),
                                      ),
                              ],
                            ),
                            onPressed: () {
                              _.setNextPage();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  }
                  return ReservationCard(
                    reservation: _.reservations[index],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
