import 'package:flutter/material.dart';

class OriginDestinationCard extends StatelessWidget {
  const OriginDestinationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 170,
        child: Row(
          children: [
            Container(
              width: 10,
              color: const Color.fromRGBO(
                2,
                39,
                108,
                1,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(
                  10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Origin / Destination',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(
                      color: Colors.grey[500],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Load Type: Full Container Load',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Shipment Type: Full Container Load',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Divider(
                      color: Colors.grey[500],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 55,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
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
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
