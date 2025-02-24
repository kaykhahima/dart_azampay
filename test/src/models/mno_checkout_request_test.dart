import 'package:dart_azampay/enums.dart';
import 'package:dart_azampay/models.dart';
import 'package:test/test.dart';

void main() {
  group('Mno checkout request', () {
    test('model', () {
      final mnoRequest = MnoCheckoutRequest(
        accountNumber: '255764XXXXXX',
        additionalProperties: AdditionalProperties(data: {'prop1': 'value1'}),
        amount: '1000',
        currency: 'TZS',
        externalId: 'external-id',
        provider: MnoProvider.mixxByYas,
      );

      final map = mnoRequest.toMap();

      final result = MnoCheckoutRequest.fromMap(map);

      expect(result.accountNumber, '255764XXXXXX');
      expect(result.additionalProperties?.data, {
        'data': {'prop1': 'value1'}
      });
      expect(result.amount, '1000');
      expect(result.currency, 'TZS');
      expect(result.externalId, 'external-id');
      expect(result.provider, MnoProvider.mixxByYas);
    });
  });
}
