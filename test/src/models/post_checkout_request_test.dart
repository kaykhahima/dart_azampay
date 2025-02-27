import 'package:dart_azampay/src/models/post_checkout_request.dart';
import 'package:test/test.dart';

void main() {
  group('Post checkout request', () {
    final items = [
      {
        'itemId': '1',
        'itemName': 'Item 1',
        'itemDescription': 'Description 1',
        'itemPrice': 10.0,
      },
      {
        'itemId': '2',
        'itemName': 'Item 2',
        'itemDescription': 'Description 2',
        'itemPrice': 20.0,
      }
    ];

    final postCheckoutPayload = {
      'clientId': 'client-id',
      'appName': 'app-name',
      'amount': '1000',
      'currency': 'TZS',
      'language': 'en',
      'cart': {'items': items},
      'externalId': 'external-id',
      'redirectFailURL': 'https://example.com/fail',
      'redirectSuccessURL': 'https://example.com/success',
      'requestOrigin': 'https://example.com',
      'vendorId': 'vendor-id',
      'vendorName': 'vendor-name',
    };

    test('check if a list of items can be converted to a Cart model', () {
      final cart = Cart(items: items);

      final map = cart.toMap();
      final result = Cart.fromMap(map);

      expect(result, isA<Cart>());
    });

    test('check if json can be converted to map', () {
      final result = PostCheckoutRequest.fromMap(postCheckoutPayload);
      expect(result, isA<PostCheckoutRequest>());
    });

    test('model', () {
      final postCheckoutRequest = PostCheckoutRequest(
        amount: '1000',
        currency: 'TZS',
        externalId: 'external-id',
        clientId: 'client-id',
        appName: 'app-name',
        language: 'en',
        cart: Cart(items: items),
        redirectFailURL: 'https://example.com/fail',
        redirectSuccessURL: 'https://example.com/success',
        requestOrigin: 'https://example.com',
        vendorId: 'vendor-id',
        vendorName: 'vendor-name',
      );

      final map = postCheckoutRequest.toMap();
      final result = PostCheckoutRequest.fromMap(map);

      expect(map, isA<Map<String, dynamic>>());
      expect(result, isA<PostCheckoutRequest>());

      // expect(result.amount, '1000');
      // expect(result.currency, 'TZS');
      // expect(result.externalId, 'external-id');
      // expect(result.redirectFailURL, 'https://example.com/fail');
      // expect(result.cart.items.length, 2);
    });
  });
}
