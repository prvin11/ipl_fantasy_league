import 'package:flutter/material.dart';
import 'package:ipl_fantasy_league/models/team.dart';

Widget buildTeamNameColumn(String text, List<Team> teams) {
  return Container(
    decoration: BoxDecoration(border: Border.all()),
    child: Column(
      children: List.generate(teams.length + 1, (int index) {
        if (index == 0) {
          return buildHeaderText(text);
        }
        return buildContentText(teams[index - 1].name);
      }),
    ),
  );
}

Widget buildSNoColumn(String text, List<Team> teams) {
  return Container(
    decoration: BoxDecoration(border: Border.all()),
    child: Column(
      children: List.generate(teams.length + 1, (int index) {
        if (index == 0) {
          return buildHeaderText(text);
        }
        return buildContentText('${(index - 1) + 1}');
      }),
    ),
  );
}

Widget buildTeamPointsColumn(String text, List<Team> teams) {
  return Container(
    decoration: BoxDecoration(border: Border.all()),
    child: Column(
      children: List.generate(teams.length + 1, (int index) {
        if (index == 0) {
          return buildHeaderText(text);
        }
        return buildContentText('${teams[index - 1].teamPoints}');
      }),
    ),
  );
}

Text buildHeaderText(String text) {
  return Text(
    text,
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  );
}

Text buildContentText(String text) {
  return Text(
    text,
    style: TextStyle(fontSize: 14),
  );
}
