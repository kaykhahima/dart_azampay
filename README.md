# AzamPay Dart Package


Dart AzamPay is a Dart package that provides a simple and efficient way to integrate AzamPay payment gateway into your Dart/Flutter applications. With Azampay, you can easily make mobile and bank payments, post checkouts, disbursements, and pay bills.

## Features

- Mobile payments
- Bank payments
- Send checkout pages
- Disbursements
- Pay bills

## Installation

To use AzamPay, you need to add it to your pubspec.yaml file:

```yaml
dependencies:
  dart_azampay: latest_version
```

Then, run `flutter pub get` to install the package.

## Getting Started

### Initialize and make requests

After adding the package to your project, initialize it with your App name, client ID and secret key. You can find these information on your AzamPay portal.

If you have not registered yet, you can do so [here](https://developers.azampay.co.tz/). Register, verify your account, create an app and get your credentials.

To checkout and make payment with MNO, is as easy as follows:

```dart
// initialize the AzamPay client
final azamPayClient = AzamPayClient(
   appName: 'My-App',
   clientId: '4a4c16d1-52cc-48eddf23-bfff',
   clientSecret: 'BR2USg29BIubf...vU5ErDtc=',
   sandbox: true, // set to false for production
);

// create an instance of the Checkout service
final checkoutService = Checkout(azamPayClient);

// Create a MNOCheckoutRequest
final mnoRequest = MnoCheckoutRequest(
   accountNumber: '255764XXXXXX',
   additionalProperties: {}, //optional
   amount: '1000',
   currency: 'TZS',
   externalId: 'external-id',
   provider: MnoProvider.mpesa, // or any other provider
);

// Example usage of the checkout service
final res = await checkoutService.mnoPayment(request: mnoRequest);
print(res.data); // prints out the response data

```

### Services

This package allows you to use services based on your usage. This helps you to use only the service you need. For instance, you can only use the checkout service or the bill payment service. 

### Supported services

**1. Checkout service**

```dart
// instance of the checkout service
final checkoutService = Checkout(azamPayClient);

// mobile payment checkout
final res = await checkoutService.mnoPayment(request: mnoRequest);
print(res.data); // prints out the response data

// bank payment checkout
final res = await checkoutService.bankPayment(request: bankRequest);
print(res.data); // prints out the response data
```

**2. Partners service**

```dart
// instance of the partners service
final partnersService = Partners(azamPayClient);

// returns the list of registered partners
final partners = await partnersService.getPaymentPartners();
print(partners) // prints out the retrieved list of partners

// send a checkout request to the provided partner
await partnersService.postCheckout(request: postCheckoutRequest);
```

## Contributing

Contributions are welcome! If you have suggestions for improvements or new features, please open an issue or submit a pull request.

## License

This project is licensed under the BSD 3-Clause License. See the [LICENSE](LICENSE) file for details.

