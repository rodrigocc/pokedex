import 'dart:convert';

import 'package:pokemon_consome_api/infra/http_service_interface.dart';
import 'package:http/http.dart' as http;

class MyHttpClient implements IHttpService {
  @override
  Future get(String url) async {
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);

    return json;
  }
}
