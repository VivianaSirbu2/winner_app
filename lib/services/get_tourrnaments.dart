import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:winner_flutter_app/model/models.dart';

class GetTournaments {

  static Future<List<TournamentGroup>> getTournamentsGroup() async {
    final getTournaments = await http.get(
      Uri.parse(
          'https://test-micros1.play-online.com/missions/tournaments/list?tenant_id=2'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
    );
    final List responseBody = jsonDecode(getTournaments.body);
    return responseBody.map((e) => TournamentGroup.fromJson(e)).toList();
  }
}
