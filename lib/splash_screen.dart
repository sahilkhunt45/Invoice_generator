import 'dart:async';

import 'package:flutter/material.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    Duration duration = const Duration(seconds: 5);
    Timer(duration, () {
      Navigator.of(context).pushReplacementNamed('entrypage');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 370,
                width: 392,
                child: Image.asset(
                  'assets/images/splash.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          const Text(
            "Welcome To Sk Restaurant",
            style: TextStyle(
                color: Colors.amber,
                fontSize: 40,
                fontFamily: "SK",
                fontWeight: FontWeight.bold),
          ),
          const LinearProgressIndicator(
            color: Colors.amber,
            backgroundColor: Colors.orange,
            minHeight: 10,
          ),
        ],
      ),
    );
  }
}
