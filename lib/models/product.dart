
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable{


  Product({
    this.id,
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

  bool equals(Product product){
    return title == product.title
          && category == product.category
          && dueDate == product.dueDate
          && dailyConsume == product.dailyConsume
          && quantity == product.quantity
          && originalPrice == product.originalPrice
          && currentPrice == product.currentPrice;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, category, image, dueDate, dailyConsume, quantity, originalPrice,currentPrice];
}