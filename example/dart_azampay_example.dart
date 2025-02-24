import 'package:dart_azampay/dart_azampay.dart';

void main() async {
  final azamPayClient = AzamPayClient(
    appName: 'your_app_name',
    clientId: 'your_client_id',
    clientSecret: 'your_client_secret',
    sandbox: true, // Set to false for production
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
    provider: MnoProvider.mixxByYas, // or any other provider
  );

  // Example usage of the checkout service
  final res = await checkoutService.mnoPayment(request: mnoRequest);
  print(res.data);
}

// TODO: 2 - use secure storage for storing token?
