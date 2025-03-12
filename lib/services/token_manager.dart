part of '../../dart_azampay.dart';

/// Token manager class that handles token generation, caching and expiry
class TokenManager extends Service {
  late final http.Client _httpClient;
  late final String _authEndpoint;
  late final Map<String, String> _headers;

  // Token cache
  TokenResponse? _cachedToken;

  TokenManager(super.client) {
    _httpClient = http.Client();
    _authEndpoint = client.sandbox
        ? 'https://authenticator-sandbox.azampay.co.tz'
        : 'https://authenticator.azampay.co.tz';
    _headers = {'Content-Type': 'application/json'};
  }

  /// Gets a valid token - either from cache if valid or by generating a new one
  Future<String> getToken({required GenerateTokenRequest request}) async {
    // Check if we have a cached token that hasn't expired yet
    if (hasValidToken()) {
      return _cachedToken!.accessToken;
    }

    final response = await generateToken(request);
    _cachedToken = response;
    return response.accessToken;
  }

  /// Generates a new token by calling the authentication API
  Future<TokenResponse> generateToken(GenerateTokenRequest request) async {
    final path = '/AppRegistration/GenerateToken';
    final response = await _httpClient.post(
      Uri.parse(_authEndpoint + path),
      headers: _headers,
      body: jsonEncode(request.toMap()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to generate token: ${response.body}');
    }

    final Map<String, dynamic> data = jsonDecode(response.body);
    return TokenResponse.fromJson(data);
  }

  /// Clears the cached token, forcing a new token to be generated on next request
  void clearToken() {
    _cachedToken = null;
  }

  /// Closes the HTTP client when the manager is no longer needed
  void dispose() {
    _httpClient.close();
  }

  /// Checks if the current token is valid
  bool hasValidToken() {
    if (_cachedToken == null) return false;
    final now = DateTime.now();
    return _cachedToken!.expire.toLocal().isAfter(now);
  }

  /// Returns the expiration time of the current token, or null if no token exists
  DateTime? getTokenExpiration() {
    return _cachedToken?.expire;
  }
}
