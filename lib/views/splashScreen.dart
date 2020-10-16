import 'package:flutter/material.dart';
import 'package:talks/helper/authenticate.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Authenticate()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/icon/icon.png",
          height: 10000,
        ),
      ),
    );
  }
}
