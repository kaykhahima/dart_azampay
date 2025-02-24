part of '../../models.dart';

/// GenerateTokenRequest
class GenerateTokenRequest extends Model {
  /// The name of the application
  final String appName;

  /// The client ID generated during app registration
  final String clientId;

  /// The client secret generated during app registration
  final String clientSecret;

  GenerateTokenRequest({
    required this.appName,
    required this.clientId,
    required this.clientSecret,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'appName': appName,
      'clientId': clientId,
      'clientSecret': clientSecret,
    };
  }
}
