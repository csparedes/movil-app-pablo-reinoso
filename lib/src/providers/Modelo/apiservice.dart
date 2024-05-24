import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ApiServices {
  static String usuarioUrl = 'http://localhost:51001/Usuario/';

  static Future fetchUsuario() async {
    return await http.get(Uri.parse(usuarioUrl));
  }
}
