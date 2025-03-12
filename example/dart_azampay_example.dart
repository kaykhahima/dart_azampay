import 'package:dart_azampay/dart_azampay.dart';

void main() async {
  final azamPayClient = AzamPayClient(
    appName: 'My-App',
    clientId: 'a44c16d1-52cc-f1d084',
    clientSecret: 'DdCDy8703e...Ld7pUyyQKBtc=',
    sandbox: true, // set to false for production
  );

  // Create an instance of the Checkout service
  final checkoutService = Checkout(azamPayClient);

  // Create a MNOCheckoutRequest
  final mnoRequest = MnoCheckoutRequest(
    accountNumber: '255688XXXXXX',
    additionalProperties: {},
    amount: '1000',
    currency: 'TZS', // only supported currency at the moment
    externalId: 'external_id',
    provider: MnoProvider.airtelMoney, // or any other provider
  );

  // Example usage of the checkout service
  final res = await checkoutService.mnoPayment(request: mnoRequest);
  print('mno checkout response: ${res.data}');

  // Create an instance of the Partners service
  final partnersService = Partners(azamPayClient);

  // Get the payment partners
  final partners = await partnersService.getPaymentPartners();
  print('partners list: $partners'); // prints out the list of partners

  //get payment link
  final postCheckoutRequest = PostCheckoutRequest(
    amount: '1000',
    currency: 'TZS',
    externalId: 'external-id',
    language: 'EN',
    cart: Cart(items: []),
    redirectFailURL:
        'https://3f358fea-b97b-465d-a6ad-676bd43301ee.mock.pstmn.io',
    redirectSuccessURL:
        'https://9d248e55-b2b6-4aa5-8f7a-abf47a3c3ddc.mock.pstmn.io',
    requestOrigin: '',
    vendorId: '6ebafc56-6d4d-4265-a8d4-c0e1e7806c19',
    vendorName: 'Azampesa',
  );

  final response =
      await partnersService.requestPaymentLink(postCheckoutRequest);
  print('payment link: ${response.data}'); //prints payment link
}
