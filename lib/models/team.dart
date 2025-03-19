import 'package:flutter/material.dart';
import 'package:ipl_fantasy_league/models/player.dart';

class Team {
  Team({
    required this.name,
    required this.logo,
    required this.players,
    this.teamPoints = 0,
  });

  final Widget logo;
  final String name;
  final num teamPoints;
  final List<Player> players;
}
