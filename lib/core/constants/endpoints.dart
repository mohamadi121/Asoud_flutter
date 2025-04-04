class Endpoints {
  Endpoints._();

  static String token = 'token';
  static String baseUrl = 'http://asoud.ir/api/v1/';
  // static String baseUrl = 'http://5.34.201.94/api/v1/';

  static const Map<String, String> simpleHeader = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  static String loginCreate = "user/pin/create/";
  static String loginVerify = 'user/pin/verify/';
  static String logout = "logout/";

  /// user
  static String userAdvertise = "advertise/";
  static String userContact = 'contact/';

  /// category
  static String categoryGroupList = 'category/group/list/';
  static String categoryList = 'category/list/';
  static String subCategoryList = 'category/sub/list/';

  /// market
  static String ownerMarket = '${baseUrl}owner/market/';
  static String ownerCreateMarket = 'create/';
}
