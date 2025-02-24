import 'package:flutter/material.dart';
import 'package:ipl_fantasy_league/models/player.dart';

class Team {
  Team(
    this.name,
    this.logo,
    this.points,
    this.players,
  );

  final Widget logo;
  final String name;
  final double points;
  final List<Player> players;
}
