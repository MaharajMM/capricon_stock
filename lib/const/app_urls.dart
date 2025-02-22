import 'package:capricon_stock/const/env/env.dart';

/// This class helping putting all
/// the urls needed in apps
class AppUrls {
  AppUrls._();

  static String baseUrl = Env.developmentBaseUrl;
  static String loginUrl = "/api/auth/local";
  static String stocksUrl = "/api/stocks";
  static String searchUrl = "$stocksUrl/search";

  static String getStockByIdUrl({required String stockId}) {
    var sotckUrl = "$stocksUrl/$stockId";
    return sotckUrl;
  }
}
