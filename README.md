
# AzamPay Dart Package

![pub package](https://img.shields.io/pub/v/dart_azampay?style=flat&color=blue) ![Pub Monthly Downloads](https://img.shields.io/pub/dm/dart_azampay?label=downloads) ![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/kaykhahima/dart_azampay/dart.yml)


<p align="left">
    <img src="https://github.com/kaykhahima/dart_azampay/raw/main/doc/images/azampay-strata.png" height="180" title="Azampay Strata Logo" alt="Azampay Strata Logo">
</p>


```dart_azampay``` is a Dart package that provides a simple and efficient way to integrate AzamPay payment gateway into your Dart/Flutter applications. With Azampay, you can easily make mobile and bank payments, request payment link, disbursements, and pay bills.

## Features

- Mobile payments
- Bank payments
- Get payment partners
- Request payment link
- Disbursements
- Pay bills

## Installation

Add `dart_azampay` to your `pubspec.yaml` file:

```yaml
dependencies:
  dart_azampay: latest_version
```

Run `dart pub get` to install the package, or, install it directly from the command line:

```yaml
dart pub add dart_azampay
```

## Getting Started

### Initialize and make requests

Initialize the package with your app name, client ID, and secret key. You can find these details on your AzamPay portal. If you haven't registered yet,  you can do so [here](https://developers.azampay.co.tz/). Register, verify your account, create an app and get your credentials.

#### Example: Mobile Payment Checkout

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
print('mno checkout response: ${res.data}');
```

### Services

This package allows you to use services based on your needs. For instance, you can use only the checkout service or the bill payment service.

### Supported services

**1. Checkout service**

```dart
// instance of the checkout service
final checkoutService = Checkout(azamPayClient);

// mobile payment checkout
final res = await checkoutService.mnoPayment(request: mnoRequest);
print('mno checkout response: ${res.data}');

// bank payment checkout
final res = await checkoutService.bankPayment(request: bankRequest);
print('bank checkout response: ${res.data}');
```

**2. Partners service**

```dart
// Instance of the partners service
final partnersService = Partners(azamPayClient);

// Get payment partners
final partners = await partnersService.getPaymentPartners();
print('Partners list: $partners'); // Prints the list of partners

// Request payment link
final res = await partnersService.requestPaymentLink(postCheckoutRequest);
print('Payment link: ${res.data}'); // Prints the payment link
```

## Related packages
- [Neurotech-HQ/azampay](https://github.com/Neurotech-HQ/azampay): Python Wrapper to Azampay Payment Gateway
- [flexcodelabs/azampay](https://github.com/flexcodelabs/azampay): NodeJs SDK to help you easily and seamlessly integrate with Azampay APIs
- [alphaolomi/laravel-azampay](https://github.com/alphaolomi/laravel-azampay): Laravel package providing fluent interface to Azampay's payment services

## Contributing

Contributions are welcome! If you have suggestions for improvements or new features, please open an issue or submit a pull request.

## License

This project is licensed under the BSD 3-Clause License. See the [LICENSE](LICENSE) file for details.

## Support
I hope you find this package useful for your projects. If you'd like to show your support, there are a few simple ways you can help:
- Consider a small donation via [nisapoti.com/kaykhahima](https://nisapoti.com/kaykhahima)
- Give the repository [a ⭐️ star on GitHub](https://github.com/kaykhahima/dart_azampay). This is a free and simple way to show your endorsement.
- Leave [a 👍 like on pub.dev](https://pub.dev/packages/dart_azampay) if you're enjoying the package.
