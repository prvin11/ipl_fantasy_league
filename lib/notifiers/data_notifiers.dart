import 'package:flutter/services.dart';

class TeamDetails {
  final String teamJson;

  TeamDetails(this.teamJson);
}

Future<TeamDetails> teamDetails() async {
  final String response =
      await rootBundle.loadString('assets/ipl_2025_players.json');
  return TeamDetails(response);
}
