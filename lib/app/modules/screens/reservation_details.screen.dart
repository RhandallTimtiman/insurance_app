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

  String getCPFStatus(statusId) {
    switch (statusId) {
      case 1:
        return 'New Invoice';
      case 5:
        return 'Payment Unsuccessful';
      case 6:
        return 'Payment Successful';
      case 8:
        return 'Processing Payment';
      case 9:
        return 'Approved Payment';
      case 10:
        return 'For Payment Validation';
      default:
        return '-';
    }
  }

  String getCurrentEvent(eventId) {
    if (eventId != -1) {
      const statuses = [
        "Pending Confirmation", // 0
        "Cancelled By Booking Party", // 1
        "Cancelled By Service Provider", // 2
        "Rejected", // 3
        "Booking Confirmed", // 4
        "Booking Confirmed", // 5
        "Shipping Instructions - Pending Confirmation", // 6
        "Manage Shipping Instruction - Revised", // 7
        "Shipping Instruction - Confirmed", // 8
        "Shipping Instruction - Rejected", // 9
        "Bill of Lading Draft - Pending Confirmation", // 10
        "Bill of Lading Draft - Confirmed", // 11
        "Bill of Lading Draft - Request for Revision / Rejected", // 12
        "Accepted Invoice - Origin", // 13
        "Loading Confirmation", // 14
        "Final Bill of Lading Released", //15
        "Arrival Notice Released", //16
        "Invoice Released - Destination", // 17
        "Accepted Invoice - Destination", // 18
        "Delivery Order Released",
        "Empty Container Released",
        "Other Payment Charges",
        "Completed",
        "Return Empty Container",
        "Invoice Released - Origin",
        "Payment Submitted - Origin", // 25
        "Payment Submitted - Destination", // 26
        "Payment Validation - Origin", // 27
        "Payment Validation - Destination", // 28
        "Additional Charges Invoice Release - Origin", // Shipper 29
        "Additional Charges Payment Processing - Origin", // Shipper 30
        "Additional Charges Payment Submitted - Origin", // Shipper 31
        "Additional Charges Payment Validation - Origin", // Agent 32
        "Additional Charges Invoice Release - Destination", // Agent 33
        "Additional Charges Payment Processing - Destination", // Consignee 34
        "Additional Charges Payment Submitted - Destination", // Consignee 35
        "Additional Charges Payment Validation - Destination", // Agent 36
        "Partial Loading Confirmation", // Agent 37
        "Partial Released Empty Container", // Agent 38
        "Partial Returned Empty Container", // Agent 39
        "Origin Invoice Revision", // Shipper 40
        "Destination Invoice Revision", // Consignee 41
        "Origin Additional Charges Invoice Revision", // Shipper 42
        "Destination Additional Charges Invoice Revision", // Consignee 43
        "For Final Bill Of Lading Revision", // Consignee 44
        "Payment Approval - Origin", // 45
        "Payment Approval - Destination", // 46
        "Payment Unsuccessful - Origin", // 47
        "Payment Unsuccessful - Destination", // 48
        "Processing Payment - Origin", // 49
        "Processing Payment - Destination", // 50
        "Payment Approved - Origin", // 51
        "Payment Approved - Destination", // 52
        "Payment Successful - Origin", // 53
        "Payment Successful - Destination", // 54
        "Rebooked", // 54
        'Pending Partial Rebooking', //56
        'Pending Rebooking', // 57
        'Partially Rebooked', // 58
        'Pending Cancellation', // 59 Booking Party
        'Cancellation Rejected', // 60 -> not being used in any scenario yet
        'Pending Cancellation', // 61 Service Provider
      ];
      return statuses[eventId];
    }
    return "N / A";
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GetBuilder<ReservationDetailsController>(
      builder: (_) {
        return Scaffold(
          appBar: MainAppBar(
            title: const Text(
              '',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            onBackPress: () {
              Get.offAllNamed('/list');
            },
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 2,
                            ),
                            child: Text(
                              'Status: ${_.reservationDetails.value.transactionStatus?.name ?? 'N / A'}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ],
                      )
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
                                                  children: [
                                                    const Text(
                                                      'Status:',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    SizedBox(
                                                      width: 175,
                                                      child: Text(
                                                        getCurrentEvent(_
                                                                .reservationDetails
                                                                .value
                                                                .seaFreightTicket
                                                                ?.eventStatus ??
                                                            -1),
                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                        ),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
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
                                ),
                                // ignore: prefer_is_empty
                                _.reservationDetails.value
                                            .truckingServiceTicket!.length !=
                                        0
                                    ? Column(
                                        children: _.reservationDetails.value
                                            .truckingServiceTicket!
                                            .map(
                                              (tst) => Card(
                                                child: Container(
                                                  height: 75,
                                                  color: Colors.white,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(
                                                            10,
                                                          ),
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Service No:',
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          12,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    tst.serviceTicketId ??
                                                                        'N / A',
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          12,
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
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          12,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 175,
                                                                    child: Text(
                                                                      tst.truckingCompanyName ??
                                                                          'N / A',
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                      ),
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Status:',
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          12,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    tst.eventStatus ??
                                                                        'N / A',
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          12,
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
                                                        color: const Color
                                                            .fromRGBO(
                                                          237,
                                                          108,
                                                          77,
                                                          1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      )
                                    : const SizedBox.shrink(),
                                // ignore: prefer_is_empty
                                _.reservationDetails.value
                                            .containerInsuranceTicket?.length !=
                                        0
                                    ? Column(
                                        children: _.reservationDetails.value
                                            .containerInsuranceTicket!
                                            .map(
                                              (cit) => Card(
                                                child: Container(
                                                  height: 75,
                                                  color: Colors.white,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(
                                                            10,
                                                          ),
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Service No:',
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          12,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    cit.serviceTicketId ??
                                                                        'N / A',
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          12,
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
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          12,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 175,
                                                                    child: Text(
                                                                      cit.providerName ??
                                                                          'N / A',
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                      ),
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Status:',
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          12,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    getCPFStatus(
                                                                      cit.receivablesPayables[
                                                                          'invoiceStatus'],
                                                                    ),
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          12,
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
                                                        color: const Color
                                                            .fromRGBO(
                                                          237,
                                                          108,
                                                          77,
                                                          1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      )
                                    : const SizedBox.shrink()
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
                  _.showButton(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
