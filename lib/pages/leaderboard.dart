import 'dart:convert';

import 'package:flutter/material.dart';
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
      String teamName = team['team_name'];
      List<dynamic> playersDetails = team['players'];
      iplTeam.add(Team(
          name: teamName,
          logo: Icon(Icons.person),
          players: List.generate(playersDetails.length, (index) {
            return Player(
                name: playersDetails[index].keys.first,
                image: Icon(Icons.person),
                points: playersDetails[index].values.first,
                isOverseas: false);
          })));
    }
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
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blue.withAlpha(100),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildNumberForTeams(index + 1),
                _buildTeamAvatar(teams[index]),
                _buildTeamName(teams[index]),
                _buildTeamPoints(teams[index])
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildNumberForTeams(int number) {
    final double value = number <= 9 ? 13 : 8;
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: value),
        child: Text(
          '#$number',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildTeamAvatar(Team team) {
    return CircleAvatar(
        backgroundColor: Colors.blue.withAlpha(180),
        foregroundColor: Colors.black,
        child: Center(
          child: Text(team.name.characters.first),
        ));
  }

  Widget _buildTeamName(Team team) {
    return Expanded(
      child: Center(
        child: Text(
          team.name,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildTeamPoints(Team team) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Text(
          team.teamPoints.toString(),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
