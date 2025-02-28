part of '../../models.dart';

/// The [PostCheckoutRequest] class represents a request to initiate a checkout process.
class PostCheckoutRequest extends Model {
  /// Unique ID for the client.
  final String clientId;

  /// Name of the application.
  final String appName;

  /// Amount that will be charged from the given account.
  final String amount;

  /// Currency code that will convert amount into specific currency format
  final String currency;

  /// Language code for application to translate
  final String language;

  /// Cart object containing the items to be purchased
  final Cart cart;

  /// 30 character unique ID
  final String externalId;

  /// URL that to be redirected to at transaction failure
  final String redirectFailURL;

  /// URL to be redirected to at transaction success
  final String redirectSuccessURL;

  /// URL which the request is being originated
  final String requestOrigin;

  /// Unique ID for vendor validation
  final String vendorId;

  /// Name of the vendor
  final String vendorName;

  PostCheckoutRequest({
    required this.clientId,
    required this.appName,
    required this.amount,
    required this.currency,
    required this.language,
    required this.cart,
    required this.externalId,
    required this.redirectFailURL,
    required this.redirectSuccessURL,
    required this.requestOrigin,
    required this.vendorId,
    required this.vendorName,
  });

  factory PostCheckoutRequest.fromMap(Map<String, dynamic> map) {
    return PostCheckoutRequest(
      clientId: map['clientId'].toString(),
      appName: map['appName'].toString(),
      amount: map['amount'].toString(),
      currency: map['currency'].toString(),
      language: map['language'].toString(),
      cart: Cart.fromMap(map['cart']),
      externalId: map['externalId'].toString(),
      redirectFailURL: map['redirectFailURL'].toString(),
      redirectSuccessURL: map['redirectSuccessURL'].toString(),
      requestOrigin: map['requestOrigin'].toString(),
      vendorId: map['vendorId'].toString(),
      vendorName: map['vendorName'].toString(),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'clientId': clientId,
      'appName': appName,
      'amount': amount,
      'currency': currency,
      'language': language,
      'cart': cart.toMap(),
      'externalId': externalId,
      'redirectFailURL': redirectFailURL,
      'redirectSuccessURL': redirectSuccessURL,
      'requestOrigin': requestOrigin,
      'vendorId': vendorId,
      'vendorName': vendorName,
    };
  }
}

/// The [Cart] class represents a shopping cart containing items.
class Cart extends Model {
  final List<Map<String, dynamic>> items;

  Cart({required this.items});

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      items: List<Map<String, dynamic>>.from(map['items']),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'items': items,
    };
  }
}
