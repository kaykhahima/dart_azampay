part of '../../models.dart';

/// MnoCheckoutRequest
class MnoCheckoutRequest extends Model {
  /// Account number/MSISDN that consumer will provide. The amount will be deducted from this account.
  final String accountNumber;

  /// Additional data that calling application can provide. This is optional.
  final AdditionalProperties? additionalProperties;

  /// Amount to be deducted from the consumer account.
  final String amount;

  /// Currency code of the amount. Current support values are only (TZS)
  final String currency;

  /// Belongs to the calling application
  final String externalId;

  /// Mobile network provider
  final MnoProvider provider;

  MnoCheckoutRequest({
    required this.accountNumber,
    this.additionalProperties,
    required this.amount,
    required this.currency,
    required this.externalId,
    required this.provider,
  });

  factory MnoCheckoutRequest.fromMap(Map<String, dynamic> map) {
    return MnoCheckoutRequest(
      accountNumber: map['accountNumber'],
      additionalProperties: map['additionalProperties'] != null
          ? AdditionalProperties.fromMap(map['additionalProperties'])
          : null,
      amount: map['amount'],
      currency: map['currency'],
      externalId: map['externalId'],
      provider: MnoProvider.values.firstWhere((e) => e.name == map['provider']),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'accountNumber': accountNumber,
      'additionalProperties': additionalProperties?.toMap(),
      'amount': amount,
      'currency': currency,
      'externalId': externalId,
      'provider': provider.name,
    };
  }
}
