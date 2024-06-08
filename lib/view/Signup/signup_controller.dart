import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupController extends GetxController {
  Future<Map<String, dynamic>> signup({
    required String name,
    required String email,
    required String password,
    required String password_confirmation,
    required String contact,
    required String cnic,
  }) async {
    var headers = {
      'Accept': 'application/json',
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://admin.ktirioapp.com/api/signup'));
    request.fields.addAll({
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': password,
      'cnic': cnic,
      'contact_no': contact,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      var jsonData = json.decode(responseData);
      return {
        'success': jsonData['success'],
        'message': jsonData['message'],
      };
    } else {
      return {
        'success': false,
        'message': response.reasonPhrase,
      };
    }
  }
}
