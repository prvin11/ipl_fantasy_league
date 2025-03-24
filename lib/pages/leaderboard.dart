import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ipl_fantasy_league/custom_list_view.dart';
import 'package:ipl_fantasy_league/models/player.dart';
import 'package:ipl_fantasy_league/models/team.dart';
import 'package:ipl_fantasy_league/pages/stats_page.dart';

class LeaderBoardPage extends StatelessWidget {
  const LeaderBoardPage(this.teamJSON, {super.key});

  final String teamJSON;

  List<Team> _updateAllTeamDetails() {
    final Map<String, dynamic> data = jsonDecode(teamJSON);
    final List<dynamic> teams = data['teams'];
    final List<Team> iplTeam = <Team>[];
    for (var team in teams) {
      double teamPoints = 0;
      String teamName = team['team_name'];
      List<dynamic> playersDetails = team['players'];
      List<Player> players = List.generate(playersDetails.length, (index) {
        return Player(
            name: playersDetails[index].keys.first,
            image: Icon(Icons.person),
            points: playersDetails[index].values.first,
            isOverseas: false);
      });
      players.sort((a, b) => b.points.compareTo(a.points));
      for (Player player in players) {
        teamPoints += player.points;
      }
      iplTeam.add(Team(
          name: teamName,
          logo: Icon(Icons.person),
          players: players,
          teamPoints: teamPoints));
    }
    iplTeam.sort((a, b) => b.teamPoints.compareTo(a.teamPoints));
    return iplTeam;
  }

  @override
  Widget build(BuildContext context) {
    List<Team> teams = _updateAllTeamDetails();
    return Column(
      spacing: 10,
      children: List.generate(teams.length, (index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return PlayerDetailsPage(teams[index]);
              },
            ));
          },
          child: CommonListView(team: teams[index], index: index + 1),
        );
      }),
    );
  }
}
