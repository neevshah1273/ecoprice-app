import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../api/serverURL.dart';


Future<void> signup() async {

  Response response = await http.post(
    Uri.parse(ServerURL().url + '/user/create'),
    body: {
      'fullname' : '',
      'password' : '',
      'mobileNumber' : '',
      'isAdminstritiveUser' : false
    }
  );

}

Future<bool> authenticate(String id, String password) async {

  final queryParams = {
    'email': id,
    'password': password
  };
  final uri = Uri.parse(ServerURL().url + '/user/get').replace(queryParameters: queryParams);
  Response response = await http.get(uri);

  if(response.statusCode!=200)return false;

  return true;

}

