
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product{


  Product({
    required this.id,
    required this.title,
    required this.category,
    required this.image,
    required this.dueDate,
    required this.quantity,
    required this.currentPrice,
    required this.originalPrice,
    required this.dailyConsume,

  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);



  final String? id;

  final String? title;

  final String category;


  final String image;

  final double dueDate;

  final double dailyConsume;

  final int quantity;

  final double originalPrice;

  final double currentPrice;

}