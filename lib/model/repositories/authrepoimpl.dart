import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../config/apis.dart';
import '../usermodel.dart';

class AuthRepoImpl{



Future<User?> getUser(String userId) async {
  final url = Uri.parse('$api/api/users/$userId');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Parse JSON and map it to a User object
      final data = json.decode(response.body);
      return User.fromMap(data);
    } else {
      print('Failed to fetch user: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
  return null;
}



Future<Map<String,int>> loginUser(String username, String password) async {
  final url = Uri.parse('$api/api/login'); // Replace with your API endpoint

  try {
    // Making the POST request with a JSON body
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'username': username,
        'password': password,
      }),
    );

    // Handling the response
    if (response.statusCode >= 200 && response.statusCode<300) {
      // Assuming the API returns an integer value for successful login
      final data = json.decode(response.body);
      return { "Log In Successfully":data['value']}; // Replace 'value' with the actual key for the returned integer
    } else {
      // Handling unsuccessful responses
      return {"failed to log in":-1};
    }
  } catch (e) {
    // Handling request exceptions
    return {"Failed to Log In":-5};
  }
}


}