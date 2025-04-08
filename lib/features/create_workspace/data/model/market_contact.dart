class MarketContactModel {
  final String market;
  final String firstMobileNumber;
  final String secondMobileNumber;
  final String telephone;
  final String fax;
  final String email;
  final String websiteUrl;
  final MessengerIds messengerIds;

  MarketContactModel({
    required this.market,
    required this.firstMobileNumber,
    required this.secondMobileNumber,
    required this.telephone,
    required this.fax,
    required this.email,
    required this.websiteUrl,
    required this.messengerIds,
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
      messengerIds: MessengerIds.fromJson(json['messenger_ids']),
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
      'messenger_ids': messengerIds.toJson(),
    };
  }
}

class MessengerIds {
  final String? telegram;
  final String? whatsapp;
  final String? instagram;
  final String? eita;

  MessengerIds({this.telegram, this.whatsapp, this.instagram, this.eita});

  factory MessengerIds.fromJson(Map<String, dynamic> json) {
    return MessengerIds(
      telegram: json['telegram'] ?? "",
      whatsapp: json['whatsapp'] ?? "",
      instagram: json['instagram'] ?? "",
      eita: json['eita'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'telegram': telegram,
      'whatsapp': whatsapp,
      'eita': eita,
      'instagram': instagram,
    };
  }
}
