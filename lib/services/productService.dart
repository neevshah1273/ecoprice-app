import 'dart:convert';

import 'package:ecoprice/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../api/serverURL.dart';


Future<Product?> createProduct(Product product)async {



  

    Response response = await http.post(
        Uri.parse(ServerURL().url + '/product/create'),
        body: {
          'title' : product.title,
          'dueDate' : product.dueDate.toString(),
          'dailyConsume' : product.dailyConsume.toString(),
          'originalPrice' : product.originalPrice.toString(),
          'currentPrice' : product.currentPrice.toString(),
          'quantity' : product.quantity.toString(),
          'image' : product.image,
          'category' : product.category
        }
    );

    print(response.body);
    if(response.statusCode!=200)return null;



    Product resproduct =  Product.fromJson(jsonDecode(response.body)['result']);

    return resproduct;
  

}


Future<List<Product>> fetchAllProducts() async{

  Response response = await http.get(Uri.parse(ServerURL().url + '/product/getAll'));


  List<dynamic> productList = json.decode(response.body)['result']
      .map((data) => Product.fromJson(data))
      .toList();
  print(productList);
  return productList.cast();
}

Future<Product> fetchProduct(String id) async {
  Response response = await http.get(Uri.parse(ServerURL().url + '/product/getAll'));
  return Product.fromJson(jsonDecode(response.body)['result']);

}

Future<Product> editProduct(Product product) async{
  Response response = await http.put(
      Uri.parse(ServerURL().url + '/product/edit'),
      body: {
        'product' : jsonEncode(product)
      }
  );

  print(response.body);

  return Product.fromJson(jsonDecode(response.body)['result']);

}