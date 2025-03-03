part of '../../dart_azampay.dart';

class Disbursement extends Service {
  late String _baseUrl;

  Disbursement(super.client) {
    _baseUrl = client.sandbox
        ? 'https://api-disbursement-sandbox.azampay.co.tz'
        : 'https://api-disbursement.azampay.co.tz';
  }

  Future<Response> disburseFunds() async {
    final String apiPath = '/api/v1/azampay/disburse';
    final Map<String, dynamic> apiParams = {};
    final Map<String, String> apiHeaders = {};

    return await client.call(
      HttpMethod.post,
      path: _baseUrl + apiPath,
      params: apiParams,
      headers: apiHeaders,
    );
  }

  Future<Response> nameLookup() async {
    final String apiPath = '/api/v1/azampay/namelookup';
    final Map<String, dynamic> apiParams = {};
    final Map<String, String> apiHeaders = {};

    return await client.call(
      HttpMethod.post,
      path: _baseUrl + apiPath,
      params: apiParams,
      headers: apiHeaders,
    );
  }

  Future<Response> getTransactionStatus() async {
    final String apiPath = '/api/v1/azampay/transactionstatus';
    final Map<String, dynamic> apiParams = {};
    final Map<String, String> apiHeaders = {};

    return await client.call(
      HttpMethod.get,
      path: _baseUrl + apiPath,
      params: apiParams,
      headers: apiHeaders,
    );
  }
}
