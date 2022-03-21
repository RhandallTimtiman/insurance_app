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
    return GestureDetector(
      onTap: () {
        Get.find<ServiceController>().setActiveService(service);
        Get.toNamed('/list');
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(12),
          width: 120,
          child: Column(
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: Image.network(
                  'https://www.logolynx.com/images/logolynx/83/83a2affc03c2ae88c42b1c3ffcc7b509.jpeg',
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                service.name,
                style: const TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}
