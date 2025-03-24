import 'package:flutter/material.dart';
import 'package:ipl_fantasy_league/models/player.dart';
import 'package:ipl_fantasy_league/models/team.dart';

class CommonListView extends StatefulWidget {
  const CommonListView(
      {super.key, this.team, this.index, this.player, this.isPlayer = false});

  final Team? team;
  final int? index;
  final Player? player;
  final bool isPlayer;

  @override
  State<CommonListView> createState() => _CommonListViewState();
}

class _CommonListViewState extends State<CommonListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(55, 37, 110, 1),
      ),
      child: widget.isPlayer
          ? _buildPlayerView(widget.player!, widget.index!)
          : _buildTeamView(widget.team!, widget.index!),
    );
  }

  Widget _buildNumberForTeams(int number) {
    return Container(
      color: Color.fromRGBO(237, 50, 147, 1),
      width: 40,
      height: 40,
      child: Center(
        child: Text(
          '#$number',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildTeamAvatar(Team team) {
    return Container(
      color: Color.fromRGBO(237, 50, 147, 1),
      width: 40,
      height: 40,
      child: Center(
        child: Text(
          team.name[0],
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildTeamName(Team team) {
    return Expanded(
      child: Center(
        child: Text(
          team.name,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildTeamPoints(Team team) {
    return Container(
      height: 40,
      color: Color.fromRGBO(0, 151, 209, 1),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Text(
            team.teamPoints.toString(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildNumberForPlayers(int number) {
    return Container(
      color: Color.fromRGBO(237, 50, 147, 1),
      width: 40,
      height: 40,
      child: Center(
        child: Text(
          '$number.',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildPlayerAvatar(Player player) {
    return CircleAvatar(
        backgroundColor: Color.fromRGBO(237, 50, 147, 1),
        foregroundColor: Colors.white,
        child: Center(child: _otherTeam(player)));
  }

  Widget _otherTeam(Player player) {
    return Icon(Icons.person);
  }

  Widget _buildPlayerName(Player player) {
    return Expanded(
      child: Center(
        child: Text(
          player.name,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildPlayerPoints(Player player) {
    return Container(
      height: 40,
      color: Color.fromRGBO(0, 151, 209, 1),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Text(
            player.points.toString(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildPlayerView(Player player, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildNumberForPlayers(index),
        SizedBox(width: 5),
        _buildPlayerAvatar(player),
        _buildPlayerName(player),
        _buildPlayerPoints(player)
      ],
    );
  }

  Widget _buildTeamView(Team team, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildNumberForTeams(index),
        SizedBox(width: 5),
        _buildTeamAvatar(team),
        _buildTeamName(team),
        _buildTeamPoints(team)
      ],
    );
  }
}
