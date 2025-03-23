import 'package:asood/features/vendor/data/data_source/region_api_services.dart';

class RegionRepository {
  final RegionApiServices regionApiServices = RegionApiServices();

  Future<dynamic> getCountryList() async {
    return await regionApiServices.getCountryList();
  }

  Future<dynamic> getProvinceList(int countryId) async {
    return await regionApiServices.getProvinceList(countryId);
  }

  Future<dynamic> getCityList(int provinceId) async {
    return await regionApiServices.getCityList(provinceId);
  }
}
