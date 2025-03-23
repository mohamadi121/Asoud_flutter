import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'market_base.g.dart';

@HiveType(typeId: 1)
class MarketBaseModel extends HiveObject with EquatableMixin {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String marketType;

  @HiveField(2)
  final String businessId;

  @HiveField(3)
  final String name;

  @HiveField(4)
  final String description;

  @HiveField(5)
  final int subCategory;

  @HiveField(6)
  final String slogan;

  MarketBaseModel({
    this.id,
    required this.marketType,
    required this.businessId,
    required this.name,
    required this.description,
    required this.subCategory,
    required this.slogan,
  });

  @override
  List<Object?> get props => [
    id,
    marketType,
    businessId,
    name,
    description,
    subCategory,
    slogan,
  ];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'marketType': marketType,
      'businessId': businessId,
      'name': name,
      'description': description,
      'subCategory': subCategory,
      'slogan': slogan,
    };
  }

  factory MarketBaseModel.fromMap(Map<String, dynamic> map) {
    return MarketBaseModel(
      id: map['id'] as int?,
      marketType: map['marketType'] as String,
      businessId: map['businessId'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      subCategory: map['subCategory'] as int,
      slogan: map['slogan'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MarketBaseModel.fromJson(String source) =>
      MarketBaseModel.fromMap(json.decode(source));
}
