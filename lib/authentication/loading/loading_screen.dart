import 'package:arvent/authentication/splash/splash_screen.dart';
import 'package:arvent/constants.dart';
import 'package:arvent/mainScreen/main/mainLoading_screen.dart';
import 'package:arvent/mainScreen/main/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  static String id = "loading_screen";
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  getMail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    if (email != null) {
      Navigator.pushNamed(context, MainLoadingScreen.id);
    } else {
      Navigator.pushNamed(context, SplashScreen.id);
    }
  }

  @override
  void initState() {
    super.initState();
    getMail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: SpinKitDualRing(
          color: orange,
          size: 100.0,
        ),
      ),
    );
  }
}
