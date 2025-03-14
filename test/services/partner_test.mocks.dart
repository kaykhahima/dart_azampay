// Mocks generated by Mockito 5.4.5 from annotations
// in dart_azampay/test/services/partner_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dart_azampay/dart_azampay.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeResponse_0<T> extends _i1.SmartFake implements _i2.Response<T> {
  _FakeResponse_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockClient extends _i1.Mock implements _i2.Client {
  MockClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get appName =>
      (super.noSuchMethod(
            Invocation.getter(#appName),
            returnValue: _i3.dummyValue<String>(
              this,
              Invocation.getter(#appName),
            ),
          )
          as String);

  @override
  String get clientId =>
      (super.noSuchMethod(
            Invocation.getter(#clientId),
            returnValue: _i3.dummyValue<String>(
              this,
              Invocation.getter(#clientId),
            ),
          )
          as String);

  @override
  String get clientSecret =>
      (super.noSuchMethod(
            Invocation.getter(#clientSecret),
            returnValue: _i3.dummyValue<String>(
              this,
              Invocation.getter(#clientSecret),
            ),
          )
          as String);

  @override
  bool get sandbox =>
      (super.noSuchMethod(Invocation.getter(#sandbox), returnValue: false)
          as bool);

  @override
  _i4.Future<_i2.Response<dynamic>> call(
    _i2.HttpMethod? method, {
    String? path = '',
    Map<String, String>? headers = const {},
    Map<String, dynamic>? params = const {},
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #call,
              [method],
              {#path: path, #headers: headers, #params: params},
            ),
            returnValue: _i4.Future<_i2.Response<dynamic>>.value(
              _FakeResponse_0<dynamic>(
                this,
                Invocation.method(
                  #call,
                  [method],
                  {#path: path, #headers: headers, #params: params},
                ),
              ),
            ),
          )
          as _i4.Future<_i2.Response<dynamic>>);
}
