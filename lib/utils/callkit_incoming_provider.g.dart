// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'callkit_incoming_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$callkitIncomingHash() => r'6bf5fff15fdb88ae8665e774212af57f52eba14c';

/// See also [callkitIncoming].
@ProviderFor(callkitIncoming)
final callkitIncomingProvider = AutoDisposeProvider<CallkitIncoming>.internal(
  callkitIncoming,
  name: r'callkitIncomingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$callkitIncomingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CallkitIncomingRef = AutoDisposeProviderRef<CallkitIncoming>;
String _$getCurrentCallHash() => r'5d237957a886ba6d64c9bdd48045f9ccd2282401';

/// See also [getCurrentCall].
@ProviderFor(getCurrentCall)
final getCurrentCallProvider = AutoDisposeFutureProvider<dynamic>.internal(
  getCurrentCall,
  name: r'getCurrentCallProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCurrentCallHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetCurrentCallRef = AutoDisposeFutureProviderRef<dynamic>;
String _$getCallKitParamsFromBodyHash() =>
    r'389f2deb8e8219c2c30ada602be38fe0a62013e3';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getCallKitParamsFromBody].
@ProviderFor(getCallKitParamsFromBody)
const getCallKitParamsFromBodyProvider = GetCallKitParamsFromBodyFamily();

/// See also [getCallKitParamsFromBody].
class GetCallKitParamsFromBodyFamily extends Family<CallKitParams> {
  /// See also [getCallKitParamsFromBody].
  const GetCallKitParamsFromBodyFamily();

  /// See also [getCallKitParamsFromBody].
  GetCallKitParamsFromBodyProvider call(
    dynamic body,
  ) {
    return GetCallKitParamsFromBodyProvider(
      body,
    );
  }

  @override
  GetCallKitParamsFromBodyProvider getProviderOverride(
    covariant GetCallKitParamsFromBodyProvider provider,
  ) {
    return call(
      provider.body,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getCallKitParamsFromBodyProvider';
}

/// See also [getCallKitParamsFromBody].
class GetCallKitParamsFromBodyProvider
    extends AutoDisposeProvider<CallKitParams> {
  /// See also [getCallKitParamsFromBody].
  GetCallKitParamsFromBodyProvider(
    dynamic body,
  ) : this._internal(
          (ref) => getCallKitParamsFromBody(
            ref as GetCallKitParamsFromBodyRef,
            body,
          ),
          from: getCallKitParamsFromBodyProvider,
          name: r'getCallKitParamsFromBodyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCallKitParamsFromBodyHash,
          dependencies: GetCallKitParamsFromBodyFamily._dependencies,
          allTransitiveDependencies:
              GetCallKitParamsFromBodyFamily._allTransitiveDependencies,
          body: body,
        );

  GetCallKitParamsFromBodyProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.body,
  }) : super.internal();

  final dynamic body;

  @override
  Override overrideWith(
    CallKitParams Function(GetCallKitParamsFromBodyRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCallKitParamsFromBodyProvider._internal(
        (ref) => create(ref as GetCallKitParamsFromBodyRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        body: body,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<CallKitParams> createElement() {
    return _GetCallKitParamsFromBodyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCallKitParamsFromBodyProvider && other.body == body;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, body.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetCallKitParamsFromBodyRef on AutoDisposeProviderRef<CallKitParams> {
  /// The parameter `body` of this provider.
  dynamic get body;
}

class _GetCallKitParamsFromBodyProviderElement
    extends AutoDisposeProviderElement<CallKitParams>
    with GetCallKitParamsFromBodyRef {
  _GetCallKitParamsFromBodyProviderElement(super.provider);

  @override
  dynamic get body => (origin as GetCallKitParamsFromBodyProvider).body;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
