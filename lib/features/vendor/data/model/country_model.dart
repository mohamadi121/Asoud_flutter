class CountryModel {
  int? id;
  String? name;

  CountryModel({this.id, this.name});

  CountryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class ProvinceModel {
  int? id;
  String? name;

  ProvinceModel({this.id, this.name});

  ProvinceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class CityModel {
  int? id;
  String? name;

  CityModel({this.id, this.name});

  CityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
