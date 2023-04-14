import 'dart:convert';

import 'package:ecoprice/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../api/serverURL.dart';


Future<Product> createProduct(Product product)async {



  

    Response response = await http.post(
        Uri.parse(ServerURL().url + '/product/create'),
        body: {
          'product' : jsonEncode(product)
        }
    );

    return Product.fromJson(jsonDecode(response.body)['result']);

  

}


Future<List<Product>?> fetchAllProducts() async{

  Response response = await http.get(Uri.parse(ServerURL().url + '/product/getAll'));


  return json.decode(response.body)['result']
      .map((data) => Product.fromJson(data))
      .toList();

}

Future<Product> fetchProduct(String id) async {
  Response response = await http.get(Uri.parse(ServerURL().url + '/product/getAll'));
  return Product.fromJson(jsonDecode(response.body)['result']);

}

Future<Product> editProduct(Product product) async{
  Response response = await http.post(
      Uri.parse(ServerURL().url + '/product/create'),
      body: {
        'product' : jsonEncode(product)
      }
  );

  return Product.fromJson(jsonDecode(response.body)['result']);

}