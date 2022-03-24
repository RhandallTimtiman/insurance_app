import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance_app/app/domain/controller/controllers.dart';
import 'package:insurance_app/app/widgets/widgets.dart';

class ReservationDetailsScreen extends StatefulWidget {
  const ReservationDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ReservationDetailsScreen> createState() =>
      _ReservationDetailsScreenState();
}

class _ReservationDetailsScreenState extends State<ReservationDetailsScreen> {
  final ReservationDetailsController _reservationDetailsController = Get.find();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _reservationDetailsController.getReservationDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GetBuilder<ReservationDetailsController>(
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
                    children: [
                      Text(
                        _.reservationId.value,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
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
                      color: Color.fromRGBO(245, 245, 245, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          70,
                        ),
                      ),
                    ),
                    child: !_.isLoading.value
                        ? SingleChildScrollView(
                            child: Column(
                              children: [
                                OriginDestinationCard(
                                  reservationDetails:
                                      _.reservationDetails.value,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CommodityCard(
                                  reservationDetails:
                                      _.reservationDetails.value,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                AdditionalInformationCard(
                                  reservationDetails:
                                      _.reservationDetails.value,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      'Services',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Card(
                                  child: Container(
                                    height: 75,
                                    color: Colors.white,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: const EdgeInsets.all(
                                              10,
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    const Text(
                                                      'Service No:',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      _
                                                              .reservationDetails
                                                              .value
                                                              .seaFreightTicket
                                                              ?.serviceTicketId ??
                                                          'N / A',
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    const Text(
                                                      'Service Provider:',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      _
                                                              .reservationDetails
                                                              .value
                                                              .seaFreightTicket
                                                              ?.shippingLine
                                                              ?.companyName ??
                                                          'N / A',
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: const [
                                                    Text(
                                                      'Status:',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      'New',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 10,
                                          // height: 10,
                                          color: const Color.fromRGBO(
                                            237,
                                            108,
                                            77,
                                            1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        : Center(
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
                                  "Fetching Reservation Details",
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
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
                          'Avail Insurance',
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
                      _.summarizeContainers();
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
