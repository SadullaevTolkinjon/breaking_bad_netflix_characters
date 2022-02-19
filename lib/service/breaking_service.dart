import 'dart:convert';

import 'package:breakingbad/model/breaking_model.dart';
import 'package:http/http.dart' as http;

class Breakingservice {
  static Future<List<BreakingBad>> getBreakingservice() async {
    Uri url = Uri.parse("https://breakingbadapi.com/api/characters");
    dynamic response = await http.get(url);

    response = jsonDecode(response.body);
    return (response as List).map((e) => BreakingBad.fromJson(e)).toList();
  }
}
