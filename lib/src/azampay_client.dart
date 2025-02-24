import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:dart_azampay/src/client.dart';
import 'package:dart_azampay/src/response.dart';

import '../enums.dart';
import '../models.dart';

class AzamPayClient extends Client {
  late String _authEndpoint;
  late String _checkoutEndpoint;
  late Map<String, String> _headers;
  late http.Client _httpClient;
  String? _token;
  DateTime? _expiresAt;

  AzamPayClient({
    required super.appName,
    required super.clientId,
    required super.clientSecret,
    super.sandbox,
  }) : super() {
    print('AzamPayClient initialized');
    _httpClient = http.Client();
    _authEndpoint = sandbox == true
        ? 'https://authenticator-sandbox.azampay.co.tz'
        : 'https://authenticator.azampay.co.tz';
    _checkoutEndpoint = sandbox == true
        ? 'https://sandbox.azampay.co.tz'
        : 'https://checkout.azampay.co.tz';
    _headers = {'Content-Type': 'application/json'};
  }

  @override
  Future<Response> call(
    HttpMethod method, {
    String path = '',
    Map<String, String> headers = const {},
    Map<String, dynamic> params = const {},
  }) async {
    if (_token == null) await _generateToken();

    http.BaseRequest request = prepareRequest(
      method,
      uri: Uri.parse(_checkoutEndpoint + path),
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

  Future<void> _generateToken() async {
    final path = '/AppRegistration/GenerateToken';

    final request = GenerateTokenRequest(
      appName: appName,
      clientId: clientId,
      clientSecret: clientSecret,
    );

    if (_expiresAt != null && _expiresAt!.isAfter(DateTime.now())) {
      print('Token is still valid');
      _headers['Authorization'] = 'Bearer $_token';
      return;
    }

    final response = await _httpClient.post(
      Uri.parse(_authEndpoint + path),
      body: jsonEncode(request.toMap()),
      headers: {..._headers},
    );

    if (response.statusCode == 200) {
      //set token expiry time and add token to headers
      final decoded = jsonDecode(response.body);
      _expiresAt = decoded['data']['expires'];
      _headers['Authorization'] = 'Bearer ${decoded['data']['accessToken']}';
      print('token: $_token');
      print('expires: $_expiresAt');
    } else {
      throw Exception('Failed to generate token');
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
      print(params.toString());
      (request as http.Request).body = jsonEncode(params);
    }

    request.headers.addAll(headers);
    return request;
  }

  toResponse(http.StreamedResponse streamedResponse) async {
    final responseBody = await streamedResponse.stream.bytesToString();
    return Response(data: jsonDecode(responseBody));
  }
}
