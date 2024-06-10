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

  String? _token;
  int? _userId;
  String? get token => _token;

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    var headers = {
      'Accept': 'application/json',
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://admin.ktirioapp.com/api/login'));
    request.fields.addAll({
      'email': email,
      'password': password,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      var jsonData = json.decode(responseData);

      // Store the token
      _token = jsonData['token'];
      _userId = jsonData['data']['id'];

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

  Future<Map<String, dynamic>> getReadings() async {
    var response = await http.get(
      Uri.parse('https://admin.ktirioapp.com/api/get_readings'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $_token',
      },
    );

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      return {
        'success': true,
        'data': jsonData,
      };
    } else {
      return {
        'success': false,
        'message': response.reasonPhrase,
      };
    }
  }

  Future<Map<String, dynamic>> getNotifications() async {
    var response = await http.get(
      Uri.parse('https://admin.ktirioapp.com/api/notify'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $_token',
      },
    );

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      return {
        'success': true,
        'data': jsonData,
      };
    } else {
      return {
        'success': false,
        'message': response.reasonPhrase,
      };
    }
  }

  // Method to logout
  Future<Map<String, dynamic>> logout() async {
    if (_token == null) {
      return {
        'success': false,
        'message': 'Token not found. Please log in.',
      };
    }

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token', // Include the token in the headers
    };
    var request = http.Request(
        'POST', Uri.parse('https://admin.ktirioapp.com/api/logout'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      var jsonData = json.decode(responseData);

      // Clear the token
      _token = null;

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

  Future<Map<String, dynamic>> createSchedule({
    required String date,
    required String time,
    required String task,
  }) async {
    if (_token == null) {
      return {
        'success': false,
        'message': 'Token not found. Please log in.',
      };
    }

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token',
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://admin.ktirioapp.com/api/create_schedule'));
    request.fields.addAll({
      'date': date,
      'time': time,
      'user_id': _userId.toString(),
      'task': task,
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

// Method to get data using the stored token
  Future<Map<String, dynamic>> getData() async {
    if (_token == null) {
      return {
        'success': false,
        'message': 'Token not found. Please log in.',
      };
    }

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token', // Include the token in the headers
    };

    var response = await http.get(
      Uri.parse('https://admin.ktirioapp.com/api/your-get-api-endpoint'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      return {
        'success': true,
        'data': jsonData,
      };
    } else {
      return {
        'success': false,
        'message': response.reasonPhrase,
      };
    }
  }
}
