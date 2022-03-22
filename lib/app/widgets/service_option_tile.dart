import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceOptionTile extends StatefulWidget {
  final dynamic serviceDetails;
  const ServiceOptionTile({Key? key, required this.serviceDetails})
      : super(key: key);

  @override
  State<ServiceOptionTile> createState() => _ServiceOptionTileState();
}

class _ServiceOptionTileState extends State<ServiceOptionTile> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onDoubleTap: (() => Get.toNamed('/list')),
      child: Card(
        elevation: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.network(
                    widget.serviceDetails['image'],
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            Container(
              height: size.height * 0.05,
              width: double.infinity,
              color: const Color.fromRGBO(
                2,
                39,
                108,
                1,
              ),
              child: Center(
                child: Text(
                  widget.serviceDetails['serviceName'].toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
