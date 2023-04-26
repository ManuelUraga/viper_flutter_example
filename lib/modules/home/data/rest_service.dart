import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'dart:convert';
import 'dart:async';

import 'package:viper_flutter_example/utility/app_exceptions.dart';

class RestService {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '2344f08f015e4a7ea9eb861d9626f615';
  final String _language = 'es-ES';
  final Logger logger = Logger();

  Future<Uri> getJsonData(String endpoint, [int page = 1]) async {
    return Uri.https(_baseUrl, endpoint,
        {'api_key': _apiKey, 'language': _language, 'page': '$page'});
  }

  Future<dynamic> get(Uri uri) async {
    logger.d('Api Get, url $uri');
    var responseJson;
    try {
      final response = await http.get(uri);
      responseJson = _returnResponse(response);
    } on SocketException {
      logger.d('No net');
      throw FetchDataException('No Internet connection');
    }
    logger.d('api get recieved!');
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body) async {
    logger.d('Api Post, url $url');
    var responseJson;
    try {
      final response = await http.post(Uri.parse(_baseUrl + url), body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      logger.d('No net');
      throw FetchDataException('No Internet connection');
    }
    logger.d('api post.');
    return responseJson;
  }

  Future<dynamic> put(String url, dynamic body) async {
    logger.d('Api Put, url $url');
    var responseJson;
    try {
      final response = await http.put(Uri.parse(_baseUrl + url), body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      logger.d('No net');
      throw FetchDataException('No Internet connection');
    }
    logger.d('api put.');
    logger.d(responseJson.toString());
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    logger.d('Api delete, url $url');
    var apiResponse;
    try {
      final response = await http.delete(Uri.parse(_baseUrl + url));
      apiResponse = _returnResponse(response);
    } on SocketException {
      logger.d('No net');
      throw FetchDataException('No Internet connection');
    }
    logger.d('api delete.');
    return apiResponse;
  }
}

dynamic _returnResponse(http.Response response) {
  var logger = Logger();
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      logger.d(responseJson);
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 404:
      throw FetchDataException('Not Found');
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
