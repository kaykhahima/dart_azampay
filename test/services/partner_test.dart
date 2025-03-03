import 'package:dart_azampay/dart_azampay.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'partner_test.mocks.dart';

@GenerateMocks([Client])
void main() {
  group('partners service', () {
    late MockClient client;
    late Partners partners;

    setUp(() {
      client = MockClient();
      when(client.sandbox).thenReturn(true);
      when(client.clientId).thenReturn('client-id');
      when(client.appName).thenReturn('app-name');
      partners = Partners(client);
    });

    test('get partners', () async {
      final data = [
        {
          "id": "6ebafc56-6d4d-4265-a8d4-c0e1e7806c19",
          "logoUrl": "https://amazonaws.com/azampesa.png",
          "partnerName": "Azampesa",
          "provider": 5,
          "vendorName": "kaykhahima_gmail_com",
          "paymentVendorId": "36a4cb2b-172c-46bc-ac50-451a8f022b40",
          "paymentPartnerId": "08d997ae-1961-4c32-8b2f-e00f53003b00",
          "paymentAcknowledgmentRoute": "",
          "currency": "TZS",
          "status": "1",
          "vendorType": "seller",
          "partnerType": "mno"
        },
        {
          "id": "bbb6121c-b158-4078-aa09-67a584100746",
          "logoUrl": "https://payment-images/halopesa.svg",
          "partnerName": "HaloPesa",
          "provider": 4,
          "vendorName": "kaykhahima_gmail_com",
          "paymentVendorId": "36a4cb2b-172c-46bc-ac50-451a8f022b40",
          "paymentPartnerId": "08d99549-2d49-4694-8320-f60b4e76be6a",
          "paymentAcknowledgmentRoute": "",
          "currency": "TZS",
          "status": "1",
          "vendorType": "seller",
          "partnerType": "mno"
        }
      ];

      when(client.call(
        HttpMethod.get,
        path: 'https://sandbox.azampay.co.tz/api/v1/Partner/GetPaymentPartners',
        headers: {},
        params: {},
      )).thenAnswer((_) async => Response(data: data));

      final res = await partners.getPaymentPartners();
      expect(res, isA<List<Partner>>());
      expect(res.isEmpty, false);
    });

    test('post checkout', () async {
      final request = PostCheckoutRequest(
        amount: '1000',
        currency: 'TZS',
        externalId: 'external-id',
        language: 'en',
        cart: Cart(items: []),
        redirectFailURL: 'https://example.com/fail',
        redirectSuccessURL: 'https://example.com/success',
        requestOrigin: 'https://example.com',
        vendorId: 'vendor-id',
        vendorName: 'vendor-name',
      );

      final params = {
        'clientId': 'client-id',
        'appName': 'app-name',
        ...request.toMap(),
      };

      when(client.call(
        HttpMethod.post,
        path: 'https://sandbox.azampay.co.tz/api/v1/Partner/PostCheckout',
        headers: {},
        params: params,
      )).thenAnswer((_) async => Response(data: {}));

      final res = await partners.requestPaymentLink(request);
      expect(res, isA<Response>());
    });
  });
}
