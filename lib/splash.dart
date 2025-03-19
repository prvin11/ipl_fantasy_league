import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ipl_fantasy_league/main.dart';
import 'package:ipl_fantasy_league/notifiers/data_notifiers.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => FutureProvider<TeamDetails>(
                    create: (context) => teamDetails(),
                    initialData: TeamDetails(''),
                    child: LeaderBoardScreen()))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 120, width: 300, child: Image.asset('assets/stump.png')),
            Text(
              'IPL Fantasy League',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
