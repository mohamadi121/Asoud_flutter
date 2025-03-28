class Endpoints {
  Endpoints._();

  static String token = 'token';
  static String baseUrl = 'http://asoud.ir/api/v1/';
  // static String baseUrl = 'http://5.34.201.94/api/v1/';

  static const Map<String, String> simpleHeader = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  static String login = '${baseUrl}user/';
  static String loginCreate = "pin/create/";
  static String loginVerify = 'pin/verify/';
  static String logout = "logout/";

  /// user
  static String userAdvertise = "advertise/";
  static String userContact = 'contact/';

  /// category
  static String userCategory = '${baseUrl}category/';
  static String categoryGroupList = 'group/list/';
  static String categoryList = 'list/';
  static String subCategoryList = 'sub/list/';

  /// market
  static String ownerMarket = '${baseUrl}owner/market/';
  static String ownerCreateMarket = 'create/';
}
