part of '../../models.dart';

/// TokenResponse
class TokenResponse extends Model {
  final String accessToken;
  final DateTime expire;
  final String message;
  final bool success;
  final int messageCode;
  final int statusCode;

  TokenResponse({
    required this.accessToken,
    required this.expire,
    required this.message,
    required this.success,
    required this.messageCode,
    required this.statusCode,
  });

  factory TokenResponse.fromJson(Map<String, dynamic> json) {
    return TokenResponse(
      accessToken: json['data']['accessToken'],
      expire: DateTime.parse(json['data']['expire']),
      message: json['message'],
      success: json['success'],
      messageCode: json['messageCode'],
      statusCode: json['statusCode'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'accessToken': accessToken,
      'expire': expire.toIso8601String(),
      'message': message,
      'success': success,
      'messageCode': messageCode,
      'statusCode': statusCode,
    };
  }
}
