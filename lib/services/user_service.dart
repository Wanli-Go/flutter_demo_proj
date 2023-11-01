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
}
