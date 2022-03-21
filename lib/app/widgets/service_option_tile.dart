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
    return GestureDetector(
      onTap: (() => Get.toNamed('/list')),
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
                  widget.serviceDetails['image'],
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.serviceDetails['serviceName'],
                style: const TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}
