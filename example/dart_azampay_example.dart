import 'package:dart_azampay/dart_azampay.dart';

void main() async {
  final azamPayClient = AzamPayClient(
    appName: 'My-App',
    clientId: '4a4c16d1-52cc-48eddf23-bfff',
    clientSecret: 'BR2USg29BIubf...vU5ErDtc=',
    sandbox: true, // set to false for production
  );

  // Create an instance of the Checkout service
  final checkoutService = Checkout(azamPayClient);

  // Create a MNOCheckoutRequest
  final mnoRequest = MnoCheckoutRequest(
    accountNumber: '255764XXXXXX',
    additionalProperties: {}, //optional
    amount: '1000',
    currency: 'TZS', // only supported currency at the moment
    externalId: 'external_id',
    provider: MnoProvider.mpesa, // or any other provider
  );

  // Example usage of the checkout service
  final res = await checkoutService.mnoPayment(request: mnoRequest);
  print(res.data); // prints out the response data
}
