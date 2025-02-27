part of '../../enums.dart';

/// Bank Providers
enum BankProvider {
  crdb,
  nmb,
}

extension BankProviderExtension on BankProvider {
  String get name {
    switch (this) {
      case BankProvider.crdb:
        return 'CRDB';
      case BankProvider.nmb:
        return 'NMB';
    }
  }
}
