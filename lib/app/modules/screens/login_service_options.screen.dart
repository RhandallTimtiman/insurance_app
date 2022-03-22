import 'dart:math';

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
          gradient: LinearGradient(
            stops: [
              -0.026,
              0.98,
              1.0,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xFF02276c),
              Color(0xFFffffff),
              Color(0xFFffffff),
            ],
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
                    // const Text(
                    //   'LOGIN AS',
                    //   style: TextStyle(
                    //     fontSize: 24,
                    //     fontWeight: FontWeight.bold,
                    //     color: Color.fromRGBO(
                    //       2,
                    //       39,
                    //       108,
                    //       1,
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: const [
                    //     Expanded(
                    //       flex: 1,
                    //       child: Divider(
                    //         thickness: 2,
                    //         color: Color.fromRGBO(
                    //           2,
                    //           39,
                    //           108,
                    //           1,
                    //         ),
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 20,
                    //     ),
                    //     Text(
                    //       'Services',
                    //       style: TextStyle(
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.bold,
                    //         color: Color.fromRGBO(
                    //           2,
                    //           39,
                    //           108,
                    //           1,
                    //         ),
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 20,
                    //     ),
                    //     Expanded(
                    //       flex: 1,
                    //       child: Divider(
                    //         thickness: 2,
                    //         color: Color.fromRGBO(
                    //           2,
                    //           39,
                    //           108,
                    //           1,
                    //         ),
                    //       ),
                    //     )
                    //   ],
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
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
                    // Column(
                    //   children: services.map((e) {
                    //     return Column(
                    //       children: [
                    //         ServiceOptionTile(serviceDetails: e),
                    //         const SizedBox(
                    //           height: 10,
                    //         )
                    //       ],
                    //     );
                    //   }).toList(),
                    // ),
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
