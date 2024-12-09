import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:ilpverifyapp/config/dummy.dart';

import '../../config/apis.dart';
import '../permit.dart';

class PermitRepoImpl{

  // Function to make a POST request
Future<Map<String,dynamic>> createPermit(Permit permit) async {
  final url = Uri.parse('$api/api/permit'); // Replace with your API endpoint

  // try {
  //   final response = await http.post(
  //     url,
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //     body: json.encode(permit.toMap()),
  //   );

  //   if (response.statusCode >= 200 && response.statusCode<300 ) {
  //     return {'Permit created successfully.':1};
  //   } else {
  //     return {'Error adding permit':-1};
  //   }
  // } catch (e) {
  //   return {"Failed to send request":"-3"};
  // }
  dummypermit.add(permit);
  return {'Permit created successfully.':1};
}

// Function to make a PUT request
Future<Map<String,dynamic>> updatePermit(Permit permit) async {
  final url = Uri.parse('$api/api/permit/${permit.id}'); // Replace with your API endpoint

  try {
    final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(permit.toMap()),
    );


    if (response.statusCode >= 200 && response.statusCode<300 ) {
      return {'Permit created successfully.':1};
    } else {
      return {'Error adding permit':-1};
    }
  } catch (e) {
    return {"Failed to send request":"-3"};
  }
}

Future<List<Permit>> fetchPermits() async {
  final url = Uri.parse('$api/api/permits'); // Replace with your API endpoint

  // try {
  //   final response = await http.get(
  //     url,
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //   );

  //   if (response.statusCode >= 200 && response.statusCode<300) {
  //     // Parse the JSON response into a List of Permits
  //     final List<dynamic> responseData = json.decode(response.body);
  //     return responseData.map((data) => Permit.fromMap(data)).toList();
  //   } else {
  //     print('Error: ${response.statusCode} - ${response.reasonPhrase}');
  //     return [];
  //   }
  // } catch (e) {
  //   print('Request failed: $e');
  //   return [];
  // }
  return dummypermit;
}




}