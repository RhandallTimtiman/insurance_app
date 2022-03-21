import 'package:flutter/material.dart';
import 'package:insurance_app/app/widgets/main_app_bar.dart';

class ContainerProtectionScreen extends StatefulWidget {
  const ContainerProtectionScreen({Key? key}) : super(key: key);

  @override
  State<ContainerProtectionScreen> createState() =>
      _ContainerProtectionScreenState();
}

class _ContainerProtectionScreenState extends State<ContainerProtectionScreen> {
  List<dynamic> insuranceOption = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const MainAppBar(
        title: Text(
          'Container Protection',
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.all(8),
        color: Colors.grey[100],
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Insurance Option',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (ctx, index) {
                        return const SizedBox(
                          height: 15,
                        );
                      },
                      shrinkWrap: true,
                      itemCount: insuranceOption.length,
                      itemBuilder: (ctx, index) {
                        return Material(
                          elevation: 1,
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Image.network(
                                    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/insurance-company-logo-design-template-c4d9a50f19f47cda2623bab391df4193_screen.jpg?ts=1610149913',
                                    height: 150,
                                    width: 160,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Insurance Name',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      'Insurance Details',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.all(8),
          height: 50,
          width: size.width, //set your width here
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.orange,
                ),
                child: const Center(
                  child: Text(
                    'PHP 100',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.orange,
                child: MaterialButton(
                  minWidth: 100,
                  onPressed: () {},
                  child: const Text(
                    'Pay now',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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
