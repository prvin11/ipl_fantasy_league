import 'package:http/http.dart' as http;
import 'dart:async';

class TeamDetails {
  final String teamJson;

  TeamDetails(this.teamJson);
}

Future<TeamDetails> teamDetails() async {
  final String url = 'https://prvin11.github.io/host_api/fantasy.json';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return TeamDetails(response.body);
  } else {
    return TeamDetails('');
  }
}
