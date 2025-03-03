part of '../../dart_azampay.dart';

/// This class provides access to the Azampay Partners API
class Partners extends Service {
  late String _baseUrl;

  Partners(super.client) {
    _baseUrl = client.sandbox
        ? 'https://sandbox.azampay.co.tz'
        : 'https://checkout.azampay.co.tz';
  }

  /// Get the registered partners of the provided merchant
  Future<List<Partner>> getPaymentPartners() async {
    final String apiPath = '/api/v1/Partner/GetPaymentPartners';
    final Map<String, dynamic> apiParams = {};
    final Map<String, String> apiHeaders = {};

    final res = await client.call(
      HttpMethod.get,
      path: _baseUrl + apiPath,
      params: apiParams,
      headers: apiHeaders,
    );

    return res.data?.map<Partner>((p) => Partner.fromMap(p)).toList() ?? [];
  }

  /// Send a checkout request to the provided partner.
  ///
  /// The response will contain with the URL of your payments.
  /// Merchant Application can open this url in a new window to continue
  /// with the checkout process of the transaction
  Future<Response> requestPaymentLink(PostCheckoutRequest request) async {
    final String apiPath = '/api/v1/Partner/PostCheckout';
    final Map<String, dynamic> apiParams = request.toMap();
    final Map<String, String> apiHeaders = {};

    final params = {
      'clientId': client.clientId,
      'appName': client.appName,
      ...apiParams,
    };

    return await client.call(
      HttpMethod.post,
      path: _baseUrl + apiPath,
      params: params,
      headers: apiHeaders,
    );
  }
}
