import 'client.dart';

abstract class Service {
  final Client client;

  const Service(this.client);
}
