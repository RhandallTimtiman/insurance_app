import 'package:flutter/material.dart';
import 'package:insurance_app/app/widgets/widgets.dart';

class LoginServiceOptionScreen extends StatefulWidget {
  const LoginServiceOptionScreen({Key? key}) : super(key: key);

  @override
  State<LoginServiceOptionScreen> createState() =>
      _LoginServiceOptionScreenState();
}

class _LoginServiceOptionScreenState extends State<LoginServiceOptionScreen> {
  List<dynamic> services = [
    {
      'serviceName': 'Shipping Line',
      'image':
          'https://www.logolynx.com/images/logolynx/83/83a2affc03c2ae88c42b1c3ffcc7b509.jpeg'
    },
    {
      'serviceName': 'Shipping Agency',
      'image':
          'https://www.logolynx.com/images/logolynx/83/83a2affc03c2ae88c42b1c3ffcc7b509.jpeg'
    },
    {
      'serviceName': 'Trucking',
      'image':
          'https://www.logolynx.com/images/logolynx/83/83a2affc03c2ae88c42b1c3ffcc7b509.jpeg'
    }
  ];
  bool isHovered = false;
  void onEntered(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });
  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..scale(1.5);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
          child: Center(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: services.length,
              itemBuilder: ((context, index) {
                return Center(
                  child: MouseRegion(
                    onEnter: ((event) => (onEntered)(true)),
                    onExit: ((event) => onEntered(false)),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      transform: transform,
                      child: ServiceOptionTile(
                        serviceDetails: services[index],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
