part of '../../models.dart';

/// BankCheckoutRequest
class BankCheckoutRequest extends Model {
  /// Additional data that calling application can provide. This is optional
  final Map<String, dynamic>? additionalProperties;

  /// Amount to be deducted from the consumer account
  final String amount;

  /// Currency code of the amount
  final String currencyCode;

  /// Account number/MSISDN that consumer will provide. The amount will be deducted from this account
  final String merchantAccountNumber;

  /// Mobile number of the merchant
  final String merchantMobileNumber;

  /// Name of the merchant
  final String? merchantName;

  /// One Time Password
  final String otp;

  /// Bank provider
  final BankProvider provider;

  /// Reference ID. This is optional
  final String? referenceId;

  BankCheckoutRequest({
    required this.merchantAccountNumber,
    required this.merchantMobileNumber,
    this.merchantName,
    required this.amount,
    required this.currencyCode,
    required this.provider,
    required this.otp,
    this.referenceId,
    this.additionalProperties,
  });

  factory BankCheckoutRequest.fromMap(Map<String, dynamic> map) {
    return BankCheckoutRequest(
      merchantAccountNumber: map['merchantAccountNumber'],
      merchantMobileNumber: map['merchantMobileNumber'],
      merchantName: map['merchantName'],
      amount: map['amount'],
      currencyCode: map['currencyCode'],
      provider:
          BankProvider.values.firstWhere((e) => e.name == map['provider']),
      otp: map['otp'],
      referenceId: map['referenceId'],
      additionalProperties: map['additionalProperties'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'merchantAccountNumber': merchantAccountNumber,
      'merchantMobileNumber': merchantMobileNumber,
      'merchantName': merchantName,
      'amount': amount,
      'currencyCode': currencyCode,
      'provider': provider,
      'otp': otp,
      'referenceId': referenceId,
      'additionalProperties': additionalProperties,
    };
  }
}
