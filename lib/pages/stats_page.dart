import 'package:flutter/material.dart';
import 'package:ipl_fantasy_league/models/player.dart';
import 'package:ipl_fantasy_league/models/team.dart';

class PlayerDetailsPage extends StatelessWidget {
  const PlayerDetailsPage(this.team, {super.key});

  final Team team;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            team.name,
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(child: PlayerDetails(team.players)),
        ),
      ),
    );
  }
}

class PlayerDetails extends StatelessWidget {
  const PlayerDetails(this.players, {super.key});

  final List<Player> players;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: List.generate(players.length, (index) {
        final Player player = players[index];
        return Container(
          decoration: BoxDecoration(
              color: Colors.blue.withAlpha(100),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildNumberForTeams(index + 1),
              _buildTeamAvatar(player),
              _buildTeamName(player),
              _buildTeamPoints(player)
            ],
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

  Widget _buildTeamAvatar(Player player) {
    return CircleAvatar(
        backgroundColor: Colors.blue.withAlpha(180),
        foregroundColor: Colors.black,
        child: Center(
          child: Text(player.name.characters.first),
        ));
  }

  Widget _buildTeamName(Player player) {
    return Expanded(
      child: Center(
        child: Text(
          player.name,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildTeamPoints(Player player) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Text(
          player.points.toString(),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
