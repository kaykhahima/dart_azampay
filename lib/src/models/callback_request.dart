part of '../../models.dart';

/// CallbackRequest
class CallbackRequest extends Model {
  /// Additional data that calling application can provide. This is optional
  final Map<String, dynamic>? additionalProperties;

  /// Amount to be deducted from the consumer account
  final String amount;

  /// Reference ID from partner FSP (Financial Service Provider). Optional
  final String? fspReferenceId;

  /// Transaction description message
  final String message;

  /// Account number/MSISDN that consumer will provide. The amount will be deducted from this account
  final String msisdn;

  /// Mobile network provider
  final MnoProvider operator;

  /// Reference/transaction ID
  final String reference;

  /// Field is reserved for future use
  final String? submerchantAcc;

  /// Status of the transaction. 'success' or 'failure'
  final String transactionstatus;

  /// ID that belongs to the calling application.
  final String utilityref;

  CallbackRequest({
    this.additionalProperties,
    required this.amount,
    this.fspReferenceId,
    required this.message,
    required this.msisdn,
    required this.operator,
    required this.reference,
    this.submerchantAcc,
    required this.transactionstatus,
    required this.utilityref,
  });

  factory CallbackRequest.fromMap(Map<String, dynamic> map) {
    return CallbackRequest(
      additionalProperties: map['additionalProperties'],
      amount: map['amount'],
      fspReferenceId: map['fspReferenceId'],
      message: map['message'],
      msisdn: map['msisdn'],
      operator: MnoProvider.values.firstWhere((e) => e.name == map['operator']),
      reference: map['reference'],
      submerchantAcc: map['submerchantAcc'],
      transactionstatus: map['transactionstatus'],
      utilityref: map['utilityref'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'additionalProperties': additionalProperties,
      'amount': amount,
      'fspReferenceId': fspReferenceId,
      'message': message,
      'msisdn': msisdn,
      'operator': operator.name,
      'reference': reference,
      'submerchantAcc': submerchantAcc,
      'transactionstatus': transactionstatus,
      'utilityref': utilityref,
    };
  }
}
