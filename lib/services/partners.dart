part of '../../dart_azampay.dart';

class Partners extends Service {
  const Partners(super.client);

  Future<List<Partner>> getPaymentPartners() async {
    final String apiPath = '/api/v1/Partner/GetPaymentPartners';
    final Map<String, dynamic> apiParams = {};
    final Map<String, String> apiHeaders = {};

    final res = await client.call(
      HttpMethod.get,
      path: apiPath,
      params: apiParams,
      headers: apiHeaders,
    );

    return res.data?.map<Partner>((p) => Partner.fromMap(p)).toList() ?? [];
  }
}
