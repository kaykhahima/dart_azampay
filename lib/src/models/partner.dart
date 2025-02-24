part of '../../models.dart';

/// Partner
class Partner extends Model {
  /// ID of the partner
  final String? id;

  /// Payment Partner logo URL
  final String? logoUrl;

  /// Name of the payment partner e.g (Azampesa, Airtel, Halopesa, Tigopesa, vodacom)
  final String? partnerName;

  /// Provider value e.g (airtel=2, tigo=3, halopesa=4, azampesa=5, Mpesa=10)
  final int? provider;

  /// Name of the vendor
  final String? vendorName;

  /// Unique ID for payment vendor
  final String? paymentVendorId;

  /// Unique ID for payment partner
  final String? paymentPartnerId;

  /// URL of the payment acknowledgement route
  final String? paymentAcknowledgmentRoute;

  /// Currency code that will convert amount into specific currency format
  final String? currency;

  /// Status of the partner
  final String? status;

  /// Type of the vendor
  final String? vendorType;

  /// Type of the partner
  final String? partnerType;

  Partner({
    this.id,
    this.logoUrl,
    this.partnerName,
    this.provider,
    this.vendorName,
    this.paymentVendorId,
    this.paymentPartnerId,
    this.paymentAcknowledgmentRoute,
    this.currency,
    this.status,
    this.vendorType,
    this.partnerType,
  });

  factory Partner.fromMap(Map<String, dynamic> map) {
    return Partner(
      id: map['id'],
      logoUrl: map['logoUrl'],
      partnerName: map['partnerName'],
      provider: map['provider'],
      vendorName: map['vendorName'],
      paymentVendorId: map['paymentVendorId'],
      paymentPartnerId: map['paymentPartnerId'],
      paymentAcknowledgmentRoute: map['paymentAcknowledgmentRoute'],
      currency: map['currency'],
      status: map['status'],
      vendorType: map['vendorType'],
      partnerType: map['partnerType'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'logoUrl': logoUrl,
      'partnerName': partnerName,
      'provider': provider,
      'vendorName': vendorName,
      'paymentVendorId': paymentVendorId,
      'paymentPartnerId': paymentPartnerId,
      'paymentAcknowledgmentRoute': paymentAcknowledgmentRoute,
      'currency': currency,
      'status': status,
      'vendorType': vendorType,
      'partnerType': partnerType,
    };
  }
}
