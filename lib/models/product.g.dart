// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      category: json['category'] as String,
      image: json['image'] as String,
      dueDate: (json['dueDate'] as num).toDouble(),
      quantity: json['quantity'] as int,
      currentPrice: (json['currentPrice'] as num).toDouble(),
      originalPrice: (json['originalPrice'] as num).toDouble(),
      dailyConsume: (json['dailyConsume'] as num).toDouble(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'category': instance.category,
      'image': instance.image,
      'dueDate': instance.dueDate,
      'dailyConsume': instance.dailyConsume,
      'quantity': instance.quantity,
      'originalPrice': instance.originalPrice,
      'currentPrice': instance.currentPrice,
    };
