import 'package:hive/hive.dart';

part 'market_contact_model.g.dart';

@HiveType(typeId: 2) // typeId باید یکتا باشد
class MarketContactModel extends HiveObject {
  @HiveField(0)
  int? id; // در Hive مقدار id باید مدیریت شود

  @HiveField(1)
  int? market;

  @HiveField(2)
  String? firstMobileNumber;

  @HiveField(3)
  String? secondMobileNumber;

  @HiveField(4)
  String? telephone;

  @HiveField(5)
  String? fax;

  @HiveField(6)
  String? email;

  @HiveField(7)
  String? websiteUrl;

  @HiveField(8)
  String? instagramId;

  @HiveField(9)
  String? telegramId;

  MarketContactModel({
    this.id, // مقدار id در Hive باید هنگام ذخیره مقداردهی شود
    this.market,
    this.firstMobileNumber,
    this.secondMobileNumber,
    this.telephone,
    this.fax,
    this.email,
    this.websiteUrl,
    this.instagramId,
    this.telegramId,
  });

  factory MarketContactModel.fromJson(Map<String, dynamic> json) {
    return MarketContactModel(
      market: json['market'],
      firstMobileNumber: json['first_mobile_number'],
      secondMobileNumber: json['second_mobile_number'],
      telephone: json['telephone'],
      fax: json['fax'],
      email: json['email'],
      websiteUrl: json['website_url'],
      instagramId: json['instagram_id'],
      telegramId: json['telegram_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'market': market,
      'first_mobile_number': firstMobileNumber,
      'second_mobile_number': secondMobileNumber,
      'telephone': telephone,
      'fax': fax,
      'email': email,
      'website_url': websiteUrl,
      'instagram_id': instagramId,
      'telegram_id': telegramId,
    };
  }
}
