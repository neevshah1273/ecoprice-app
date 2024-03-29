import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../api/serverURL.dart';
import '../models/user.dart';


Future<User?> signup(String fullname, String mobileNumber, String email, String password) async {

  Response response = await http.post(
    Uri.parse(ServerURL().url + '/user/create'),
    body: {
      'fullName' : fullname,
      'password' : password,
      'email' : email,
      'mobileNumber' : mobileNumber,
      'isAdminstritiveUser' : false.toString()
    }
  );
  //print(response.body);
  if(response.statusCode!=200)return null;
  //print(response.body);
  User user = User.fromJson(jsonDecode(response.body)['createdUser']);
  print(user.toJson().toString());
  return user;

}

Future<User?> authenticate(String id, String password) async {

  final queryParams = {
    'email': id,
    'password': password
  };

  final uri = Uri.parse(ServerURL().url + '/user/get/'+id+'/'+password);
  print(uri);
  Response response = await http.get(uri);

  print(response.statusCode);
  if(response.statusCode!=200)return null;

  return User.fromJson(jsonDecode(response.body)['result']);


}

