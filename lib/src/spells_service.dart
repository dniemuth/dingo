import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List> getSpells() async {
  final responses = await Future.wait([
    http.get(Uri.parse('https://5e.tools/data/spells/spells-ai.json')),
    http.get(Uri.parse('https://5e.tools/data/spells/spells-egw.json')),
    http.get(Uri.parse('https://5e.tools/data/spells/spells-ftd.json')),
    http.get(Uri.parse('https://5e.tools/data/spells/spells-ggr.json')),
    http.get(Uri.parse('https://5e.tools/data/spells/spells-idrotf.json')),
    http.get(Uri.parse('https://5e.tools/data/spells/spells-phb.json')),
    http.get(Uri.parse('https://5e.tools/data/spells/spells-scc.json')),
    http.get(Uri.parse('https://5e.tools/data/spells/spells-tce.json')),
    http.get(Uri.parse('https://5e.tools/data/spells/spells-xge.json')),
  ]);

  var returnList = [];
  for (var element in responses) {
    returnList.addAll(_getSpellsFromResponse(element));
  }

  return returnList;
}

List _getSpellsFromResponse(http.Response response) {
  return response.statusCode == 200 ? json.decode(response.body)['spell'] : [];
}
