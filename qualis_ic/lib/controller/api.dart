import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "https://qualis.ic.ufmt.br";

class API {
  static Future getUsers() {
    var url = baseUrl + "/qualis_conferencias_2016.json";
    return http.get(url as Uri);
  }
}
