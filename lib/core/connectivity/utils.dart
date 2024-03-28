import 'package:coolmovies/core/endpoints.dart';
import 'package:dio/dio.dart';

class RequestUtils {
  static String pathDio(String endpoint) => Endpoints.baseUrl + endpoint;

  static Map defaultMap(Map body) => {
        "data": {"attriutes": body}
      };

  static Options headerRequestDio() =>
      Options(headers: {"Content-Type": "application/json", "Authorization": "Bearer dpIkvq-3He3uaXBEPE0y4pWpVo_AOUGhPPhnZbtQ46k-SzxTmg"});
}