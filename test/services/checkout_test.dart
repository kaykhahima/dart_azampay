import 'package:dart_azampay/dart_azampay.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'checkout_test.mocks.dart';

@GenerateMocks([Client])
void main() {
  group('make a payment request', () {
    late MockClient client;
    late Checkout checkout;

    setUp(() {
      client = MockClient();
      checkout = Checkout(client);
    });

    test('mno', () async {
      final request = MnoCheckoutRequest(
        accountNumber: '255764XXXXXX',
        additionalProperties: {},
        amount: '1000',
        currency: 'TZS',
        externalId: 'external-id',
        provider: MnoProvider.mixxByYas,
      );

      final data = {
        "success": true,
        "transactionId": "ab1edccae210452188676c24df0ffa40",
        "message": "Your request has been received and is being processed.",
        "messageCode": 0
      };

      when(client.call(
        HttpMethod.post,
        path: '/azampay/mno/checkout',
        headers: {},
        params: request.toMap(),
      )).thenAnswer((_) async => Response(data: data));

      final res = await checkout.mnoPayment(request: request);
      expect(res, isA<Response>());
      expect(res.data['success'], isTrue);
    });

    test('bad request', () async {
      final request = MnoCheckoutRequest(
        accountNumber: '255764XXXXXX',
        additionalProperties: {},
        amount: '1000',
        currency: 'TZS',
        externalId: 'external-id',
        provider: MnoProvider.airtelMoney,
      );

      final data = {
        "errors": {
          "provider": [
            "Error converting value \"Airttel\" to type 'PGvNext.Models.Common.Provider'. Path 'provider', line 7, position 25."
          ]
        },
        "type": "https://tools.ietf.org/html/rfc7231#section-6.5.1",
        "title": "One or more validation errors occurred.",
        "status": 400,
        "traceId": "00-725e858330b0fc3983e2608fa906e9bf-3ea84e3b8412b42a-00"
      };

      when(client.call(
        HttpMethod.post,
        path: '/azampay/mno/checkout',
        headers: {},
        params: request.toMap(),
      )).thenAnswer((_) async => Response(data: data));

      final res = await checkout.mnoPayment(request: request);
      expect(res, isA<Response>());
      expect(res.data['status'], 400);
    });

    test('bank payment', () async {
      final request = BankCheckoutRequest(
        additionalProperties: {},
        amount: '1000',
        merchantAccountNumber: '0152XXXXXX',
        merchantMobileNumber: '255764XXXXXX',
        currencyCode: 'TZS',
        otp: '',
        provider: BankProvider.crdb,
      );

      final data = {
        "success": true,
        "msg": "",
        "data": {
          "properties": {"ReferenceID": "e11fad3"}
        }
      };

      when(client.call(
        HttpMethod.post,
        path: '/azampay/bank/checkout',
        headers: {},
        params: request.toMap(),
      )).thenAnswer((_) async => Response(data: data));

      final res = await checkout.bankPayment(request: request);

      expect(res, isA<Response>());
      expect(res.data['success'], isTrue);
    });
  });
}
