part of '../../enums.dart';

/// HTTP methods
enum HttpMethod { get, post, put, delete, patch }

extension HttpMethodString on HttpMethod {
  /// Returns the HTTP method in all caps.
  String name() {
    return toString().split('.').last.toUpperCase();
  }
}
