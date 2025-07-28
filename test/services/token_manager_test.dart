import 'package:dart_azampay/dart_azampay.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'token_manager_test.mocks.dart';

@GenerateMocks([Client, TokenManager])
void main() {
  group('TokenManager', () {
    late MockClient client;
    late MockTokenManager tokenManager;

    final mockResponseJson = {
      "data": {
        "accessToken": "testToken123",
        "expire": "2025-03-12T21:04:51.000Z"
      },
      "message": "Token generated successfully",
      "success": true,
      "messageCode": 0,
      "statusCode": 200
    };

    final tokenResponse = TokenResponse.fromJson(mockResponseJson);

    final request = GenerateTokenRequest(
      appName: 'app-name',
      clientId: 'client-id',
      clientSecret: 'client-secret',
    );

    setUp(() {
      client = MockClient();
      when(client.sandbox).thenReturn(false);
      tokenManager = MockTokenManager();
    });

    // Test for generate token
    test('generate token', () async {
      when(tokenManager.generateToken(request)).thenAnswer(
          (_) => Future.value(TokenResponse.fromJson(mockResponseJson)));

      final tokenResponse = await tokenManager.generateToken(request);

      when(tokenManager.getToken(request: request))
          .thenAnswer((_) async => tokenResponse.accessToken);

      final token = await tokenManager.getToken(request: request);

      expect(tokenResponse, isA<TokenResponse>());
      expect(token, isA<String>());
      expect(token, 'testToken123');
    });

    // Test for token expire
    test('test for token expire', () async {
      final now = DateTime.now();

      when(tokenManager.hasValidToken())
          .thenReturn(tokenResponse.expire.toLocal().isAfter(now));

      final hasValidToken = tokenManager.hasValidToken();

      expect(hasValidToken, isFalse);
    });
  });
}
