part of '../../dart_azampay.dart';

/// The Checkout service provides methods for processing payments through mobile networks and banks.
class Checkout extends Service {
  late String _baseUrl;

  Checkout(super.client) {
    _baseUrl = client.sandbox
        ? 'https://sandbox.azampay.co.tz'
        : 'https://checkout.azampay.co.tz';
  }

  /// Checkout and make payment through a mobile network operator
  ///
  /// Use this endpoint to initiate a payment through a mobile network operator.
  /// The user will receive a prompt to enter their PIN.
  ///
  /// You will receive a transaction completion status upon confirmation by user
  /// through the callback endpoint you provided upon registering your application.
  Future<Response> mnoPayment({
    required MnoCheckoutRequest request,
  }) async {
    final String apiPath = '/azampay/mno/checkout';
    final Map<String, dynamic> apiParams = request.toMap();
    final Map<String, String> apiHeaders = {};

    return await client.call(
      HttpMethod.post,
      path: _baseUrl + apiPath,
      params: apiParams,
      headers: apiHeaders,
    );
  }

  Future<Response> bankPayment({
    required BankCheckoutRequest request,
  }) async {
    final String apiPath = '/azampay/bank/checkout';
    final Map<String, dynamic> apiParams = request.toMap();
    final Map<String, String> apiHeaders = {};

    return await client.call(
      HttpMethod.post,
      path: _baseUrl + apiPath,
      params: apiParams,
      headers: apiHeaders,
    );
  }

  Future<Response> requestCallback({required CallbackRequest request}) async {
    final String apiPath = '/azampay/callback/request';
    final Map<String, dynamic> apiParams = request.toMap();
    final Map<String, String> apiHeaders = {
      'content-type': 'application/json',
    };

    return await client.call(
      HttpMethod.post,
      path: _baseUrl + apiPath,
      params: apiParams,
      headers: apiHeaders,
    );
  }
}
