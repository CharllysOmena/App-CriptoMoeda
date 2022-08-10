import 'dart:convert';
import 'package:cripto/model/cripto.dart';
import 'package:http/http.dart' as http;

List<Cripto> parseCripto(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Cripto>((json) => Cripto.fromJson(json)).toList();
}

Future<List<Cripto>> fetchCripto(http.Client client) async {
  final String url =
      "https://api.nomics.com/v1/currencies/ticker?key=eb3ca72e22219c1149e4d85644685bf3c424a808&ids=BTC,ETH,XRP&convert=BRL";

  final response =
      await client.get(Uri.parse(url)).timeout(Duration(seconds: 10));
  return parseCripto(response.body);
}
