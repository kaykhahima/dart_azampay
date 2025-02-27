part of '../../enums.dart';

/// Mobile Network Operator Providers
enum MnoProvider {
  airtelMoney,
  azamPesa,
  haloPesa,
  mixxByYas,
  mpesa,
}

extension MnoProviderString on MnoProvider {
  /// Returns the name of the provider.
  String get name {
    switch (this) {
      case MnoProvider.airtelMoney:
        return 'Airtel';
      case MnoProvider.azamPesa:
        return 'Azampesa';
      case MnoProvider.haloPesa:
        return 'Halopesa';
      case MnoProvider.mixxByYas:
        return 'Tigo';
      case MnoProvider.mpesa:
        return 'MPesa';
    }
  }
}
