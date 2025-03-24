import 'package:flutter/material.dart';
import 'package:ipl_fantasy_league/custom_list_view.dart';
import 'package:ipl_fantasy_league/models/player.dart';
import 'package:ipl_fantasy_league/models/team.dart';

class PlayerDetailsPage extends StatelessWidget {
  const PlayerDetailsPage(this.team, {super.key});

  final Team team;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/background_lead.png"), // Based on your clipboard content
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: AppBar(
              backgroundColor: Colors.transparent,
              leading: BackButton(
                color: Colors.white,
                onPressed: () => Navigator.pop(context),
              ),
              title: Text(
                team.name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16, bottom: 16, left: 16, right: 16),
                  child: PlayerDetails(
                    team.players,
                    isGhostTeam: team.name.toUpperCase() == 'GHOST',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PlayerDetails extends StatelessWidget {
  const PlayerDetails(this.players, {super.key, this.isGhostTeam = false});

  final List<Player> players;
  final bool isGhostTeam;

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
          child: CommonListView(
            player: player,
            index: index + 1,
            isPlayer: true,
          ),
        );
      }),
    );
  }
}
