import 'package:amg/screens/CarsSwipe.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CarsSwipe()),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img/logo.jpg"),
                  fit: BoxFit.contain),
            ),
          ),
        ));
  }
}
