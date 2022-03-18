import 'package:flutter/material.dart';

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
            return GestureDetector(
              onDoubleTap: () {
                debugPrint('I was Tapped');
              },
              child: Material(
                elevation: 1,
                child: Container(
                  height: 200,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Container(
                        width: 20,
                        color: const Color.fromRGBO(
                          2,
                          39,
                          108,
                          1,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text(
                                    'XLOG-1245',
                                    style: TextStyle(
                                      fontSize: 15,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Status: New',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: const [
                                  Text(
                                    'Service Provider: Rhandall Providers',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 1,
                                ),
                                child: Divider(
                                  color: Colors.grey[500],
                                ),
                              ),
                              SizedBox(
                                height: 55,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            'Origin:',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Tanay, Rizal asdsa dasdasd sad sad as asdsa asdas',
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 12,
                                            ),
                                            maxLines: 2,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 40,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.arrow_forward_sharp,
                                            color: Color.fromRGBO(
                                              237,
                                              108,
                                              77,
                                              1,
                                            ),
                                            size: 30.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: const [
                                          Text(
                                            'Destination:',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Tanay, Rizal asdsa dasdasd sad sad as asdsa asdas',
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 12,
                                            ),
                                            maxLines: 2,
                                            textAlign: TextAlign.end,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 1,
                                ),
                                child: Divider(
                                  color: Colors.grey[500],
                                ),
                              ),
                              Row(
                                children: const [
                                  Text(
                                    'Shipment Date: November 27, 1998',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
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
        ),
      ),
    );
  }
}
