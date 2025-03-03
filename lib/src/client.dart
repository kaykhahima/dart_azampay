import '../dart_azampay.dart';

/// Client interface for making API requests.
abstract class Client {
  /// The name of the application
  final String appName;

  /// The client ID generated during app registration
  final String clientId;

  /// The client secret generated during app registration
  final String clientSecret;

  /// Whether to use the sandbox environment or not
  final bool sandbox;

  /// Constructor for the Client class.
  /// Requires [appName], [clientId],  and [clientSecret].
  Client({
    required this.clientId,
    required this.clientSecret,
    required this.appName,
    this.sandbox = true,
  });

  /// Send the API request.
  Future<Response> call(
    HttpMethod method, {
    String path = '',
    Map<String, String> headers = const {},
    Map<String, dynamic> params = const {},
  });
}
