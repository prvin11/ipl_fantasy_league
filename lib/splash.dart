import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ipl_fantasy_league/main.dart';
import 'package:ipl_fantasy_league/notifiers/data_notifiers.dart';
import 'package:ipl_fantasy_league/notifiers/refresh_notifier.dart';
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
              builder: (BuildContext context) => MultiProvider(providers: [
                FutureProvider<TeamDetails>(
                  create: (context) => teamDetails(),
                  initialData: TeamDetails(''),
                ),
                ChangeNotifierProvider(
                  create: (context) => RefreshNotifier(),
                )
              ], child: LeaderBoardScreen()),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/background_splash.png"), // Based on your clipboard content
            fit: BoxFit.fill, // Ensures the image fits the screen
          ),
        ),
        child: Center(
          child: SizedBox(
              height: 500, width: 300, child: Image.asset('assets/icon.png')),
        ),
      ),
    );
  }
}
