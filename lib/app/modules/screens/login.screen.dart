import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'PHILIPPINE',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(
                            2,
                            39,
                            108,
                            1,
                          ),
                        ),
                      ),
                      Text(
                        'PORTS',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(
                            2,
                            39,
                            108,
                            1,
                          ),
                        ),
                      ),
                      Text(
                        'AUTHORITY',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(
                            2,
                            39,
                            108,
                            1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Image(
                    image: AssetImage('assets/images/PPA-Logo@2x.png'),
                    width: 50,
                    height: 150,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const AuthInput(
                // prefixIcon: 'assets/icons/user-name.png',
                // controller: authController.userNameController,
                hint: 'Username',
                isPassword: false,
                obscure: false,
                // toggle: authController.toggle,
              ),
              const SizedBox(
                height: 20,
              ),
              const AuthInput(
                // prefixIcon: 'assets/icons/user-name.png',
                // controller: authController.userNameController,
                hint: 'Password',
                isPassword: true,
                obscure: false,
                // toggle: authController.toggle,
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color.fromRGBO(244, 190, 11, 1),
                  child: MaterialButton(
                    minWidth: size.width,
                    onPressed: () => {Get.toNamed('service-option')},
                    child: const Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
