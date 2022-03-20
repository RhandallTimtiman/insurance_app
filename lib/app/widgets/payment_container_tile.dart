import 'package:flutter/material.dart';

class PaymentContainerTile extends StatelessWidget {
  final List<dynamic> containerList;
  final dynamic containerInfo;
  const PaymentContainerTile(
      {Key? key, required this.containerList, required this.containerInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  containerInfo['name'].toString(),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  containerInfo['totalFeePerContainer'].toString(),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (ctx, index) {
                        return const SizedBox(
                          height: 5,
                        );
                      },
                      shrinkWrap: true,
                      itemCount: containerList.length,
                      itemBuilder: (ctx, ind) {
                        var containerListDetails = containerList[ind];
                        String fee = containerListDetails["fee"];
                        return Container(
                          padding: const EdgeInsets.only(left: 12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 10,
                                    height: 10,
                                    color: const Color.fromRGBO(
                                      237,
                                      108,
                                      77,
                                      1,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    containerListDetails['number'].toString(),
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                              Text(
                                '$fee Per Container'.toString(),
                                style: const TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
