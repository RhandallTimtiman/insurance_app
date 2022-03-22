import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance_app/app/domain/controller/controllers.dart';
import 'package:insurance_app/app/domain/model/models.dart';

class ServiceOptionTile extends StatelessWidget {
  final Service service;

  const ServiceOptionTile({
    Key? key,
    required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (() => {
            Get.find<ServiceController>().setActiveService(service),
            Get.toNamed('/list')
          }),
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
                    'https://www.logolynx.com/images/logolynx/83/83a2affc03c2ae88c42b1c3ffcc7b509.jpeg',
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
                  service.name,
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
