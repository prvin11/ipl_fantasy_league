import 'package:flutter/material.dart';
import 'package:ipl_fantasy_league/custom_widgets/refresh_button.dart';
import 'package:ipl_fantasy_league/notifiers/data_notifiers.dart';
import 'package:ipl_fantasy_league/notifiers/refresh_notifier.dart';
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

class MyScrollBehavior extends ScrollBehavior {
  @override
  Widget buildScrollbar(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child; // This hides the scrollbar
  }
}

class LeaderBoardScreen extends StatelessWidget {
  const LeaderBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RefreshNotifier>(builder:
        (BuildContext context, RefreshNotifier refresh, Widget? child) {
      return SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "assets/background_lead.png"), // Based on your clipboard content
              fit: BoxFit.fill,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/icon_lead.png'), // Based on your clipboard content
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: FutureBuilder<TeamDetails>(
                    future: teamDetails(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: ScrollConfiguration(
                            behavior: MyScrollBehavior(),
                            child: SingleChildScrollView(
                              child: Column(
                                spacing: 10,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  RefreshButton(
                                    onRefresh: () async {
                                      await Future.delayed(
                                          Duration(seconds: 1));
                                      refresh.refresh();
                                    },
                                  ),
                                  LeaderBoardPage(snapshot.data!.teamJson),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
