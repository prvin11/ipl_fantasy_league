import 'package:flutter/material.dart';
import 'package:ipl_fantasy_league/notifiers/data_notifiers.dart';
import 'package:ipl_fantasy_league/pages/leaderboard.dart';
import 'package:ipl_fantasy_league/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    theme: ThemeData(primarySwatch: Colors.deepPurple),
  ));
}

class LeaderBoardScreen extends StatelessWidget {
  LeaderBoardScreen({super.key});

  final Gradient gradient = LinearGradient(
    colors: [
      Color(0xFFFFA07A), // Light Coral
      Color.fromARGB(255, 181, 70, 70), // Dark Red
    ],
    stops: [0.4, 0.56],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              color: Colors.white,
              child: Consumer<TeamDetails>(
                builder:
                    (BuildContext context, TeamDetails value, Widget? child) {
                  if (value.teamJson == '') {
                    return CircularProgressIndicator();
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'LeaderBoards',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 40),
                          LeaderBoardPage(value.teamJson),
                        ],
                      ),
                    );
                  }
                },
              )),
        ),
      ),
    );
  }

  Future<void> getFutureBool() async {
    Future.delayed(Duration(seconds: 3));
  }
}
