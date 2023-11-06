import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:flutter/foundation.dart';
import '../models/user.dart';

class UserService {


  Future<User> fetchUserData() async {

    var response = await http.get(Uri.parse('https://your-api-url.com/user'));
    var jsonData = json.decode(response.body);
    return User.fromJson(jsonData);
    
    // Return dummy user data
    // await Future.delayed(Duration(seconds: 2));
    // return User(id: '1', name: 'John Doe', email: 'john.doe@example.com');
  }

  Future<http.Response> sendDataToBackend(Map<String, dynamic> data) async {
    final url = Uri.parse('/endpoint');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    // Check for the response status code for error handling
    // 200 OK or 201 Created indicates that the request was successful
    if (response.statusCode == 200 || response.statusCode == 201) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return response;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to send data to the backend');
    }
  }
}
