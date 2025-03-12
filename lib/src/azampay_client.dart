import 'dart:convert';
import 'package:http/http.dart' as http;

import '../dart_azampay.dart';

/// A class that manages the connection to the AzamPay API.
class AzamPayClient extends Client {
  // Singleton instance
  static AzamPayClient? _instance;

  late Map<String, String> _headers;
  late http.Client _httpClient;
  late TokenManager _tokenManager;

  // Factory constructor to return the singleton instance
  factory AzamPayClient({
    required String appName,
    required String clientId,
    required String clientSecret,
    bool? sandbox,
  }) {
    // If the instance doesn't exist, create it
    _instance ??= AzamPayClient._internal(
      appName: appName,
      clientId: clientId,
      clientSecret: clientSecret,
      sandbox: sandbox ?? true,
    );

    return _instance!;
  }

  // Private constructor that will only be called once
  AzamPayClient._internal({
    required super.appName,
    required super.clientId,
    required super.clientSecret,
    super.sandbox,
  }) : super() {
    _headers = {'Content-Type': 'application/json'};
    _httpClient = http.Client();
    _tokenManager = TokenManager(this);
  }

  @override
  Future<Response> call(
    HttpMethod method, {
    String path = '',
    Map<String, String> headers = const {},
    Map<String, dynamic> params = const {},
  }) async {
    final tokenRequest = GenerateTokenRequest(
      appName: appName,
      clientId: clientId,
      clientSecret: clientSecret,
    );

    // get a valid token (generates a new one or returns cached token)
    final token = await _tokenManager.getToken(request: tokenRequest);

    // set the token in the headers
    _headers['Authorization'] = 'Bearer $token';

    http.BaseRequest request = prepareRequest(
      method,
      uri: Uri.parse(path),
      headers: {..._headers, ...headers},
      params: params,
    );

    try {
      final streamedResponse = await _httpClient.send(request);
      return await toResponse(streamedResponse);
    } catch (e, st) {
      print(st);
      throw Exception('Failed to make request: $e');
    }
  }

  http.BaseRequest prepareRequest(
    HttpMethod method, {
    required Uri uri,
    required Map<String, String> headers,
    required Map<String, dynamic> params,
  }) {
    //remove keys with null values
    if (params.isNotEmpty) {
      params.removeWhere((key, value) => value == null);
    }

    http.BaseRequest request = http.Request(method.name(), uri);

    if (method == HttpMethod.get) {
      if (params.isNotEmpty) {
        params = params.map((key, value) {
          if (value is int || value is double) {
            return MapEntry(key, value.toString());
          }
          if (value is List) {
            return MapEntry("$key[]", value);
          }
          return MapEntry(key, value);
        });
      }
      uri = Uri(
        fragment: uri.fragment,
        path: uri.path,
        host: uri.host,
        scheme: uri.scheme,
        queryParameters: params,
        port: uri.port,
      );
      request = http.Request(method.name(), uri);
    } else {
      (request as http.Request).body = jsonEncode(params);
    }

    request.headers.addAll(headers);
    return request;
  }

  toResponse(http.StreamedResponse streamedResponse) async {
    final responseBody = await streamedResponse.stream.bytesToString();
    late dynamic data;
    try {
      data = jsonDecode(responseBody);
    } catch (e) {
      data = responseBody;
    }
    return Response(data: data);
  }
}
