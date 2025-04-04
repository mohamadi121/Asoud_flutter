abstract class RegionRepository {
  Future<dynamic> getCountryList() async {}

  Future<dynamic> getProvinceList(int countryId) async {}

  Future<dynamic> getCityList(int provinceId) async {}
}
