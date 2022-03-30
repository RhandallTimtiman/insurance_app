import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance_app/app/domain/controller/controllers.dart';
import 'package:insurance_app/app/widgets/widgets.dart';

class LoginServiceOptionScreen extends StatefulWidget {
  const LoginServiceOptionScreen({Key? key}) : super(key: key);

  @override
  State<LoginServiceOptionScreen> createState() =>
      _LoginServiceOptionScreenState();
}

class _LoginServiceOptionScreenState extends State<LoginServiceOptionScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/loginBG.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GetBuilder<ServiceController>(
                      builder: (_) {
                        return SizedBox(
                          width: size.width * 0.5,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: _.services.length,
                            itemBuilder: ((ctx, index) {
                              return Center(
                                child: ServiceOptionTile(
                                  service: _.services[index],
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
