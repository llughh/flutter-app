import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  final String claveUrl = 'URL_DEL_SERVICIO_CLAVE';

  Future<String> authenticateWithClave(String user, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$claveUrl/authenticate'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': user,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        if (responseJson['token'] != null) {
          return responseJson['token'];
        } else {
          throw Exception('Token no encontrado en la respuesta');
        }
      } else {
        throw Exception('Error en la autenticación: ${response.statusCode} ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error al conectar con el servicio: $e');
    }
  }
}
