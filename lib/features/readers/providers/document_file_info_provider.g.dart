// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_file_info_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$documentFileInfoHash() => r'36de87cbff42294eb0fa9aaa247df0cce470cd48';

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

/// See also [documentFileInfo].
@ProviderFor(documentFileInfo)
const documentFileInfoProvider = DocumentFileInfoFamily();

/// See also [documentFileInfo].
class DocumentFileInfoFamily extends Family<
    AsyncValue<
        ({
          String? title,
          String? author,
          String? coverImagePath,
          String? newFilePath
        })>> {
  /// See also [documentFileInfo].
  const DocumentFileInfoFamily();

  /// See also [documentFileInfo].
  DocumentFileInfoProvider call(
    File file,
    BookType type,
  ) {
    return DocumentFileInfoProvider(
      file,
      type,
    );
  }

  @override
  DocumentFileInfoProvider getProviderOverride(
    covariant DocumentFileInfoProvider provider,
  ) {
    return call(
      provider.file,
      provider.type,
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
  String? get name => r'documentFileInfoProvider';
}

/// See also [documentFileInfo].
class DocumentFileInfoProvider extends AutoDisposeFutureProvider<
    ({
      String? title,
      String? author,
      String? coverImagePath,
      String? newFilePath
    })> {
  /// See also [documentFileInfo].
  DocumentFileInfoProvider(
    File file,
    BookType type,
  ) : this._internal(
          (ref) => documentFileInfo(
            ref as DocumentFileInfoRef,
            file,
            type,
          ),
          from: documentFileInfoProvider,
          name: r'documentFileInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$documentFileInfoHash,
          dependencies: DocumentFileInfoFamily._dependencies,
          allTransitiveDependencies:
              DocumentFileInfoFamily._allTransitiveDependencies,
          file: file,
          type: type,
        );

  DocumentFileInfoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.file,
    required this.type,
  }) : super.internal();

  final File file;
  final BookType type;

  @override
  Override overrideWith(
    FutureOr<
                ({
                  String? title,
                  String? author,
                  String? coverImagePath,
                  String? newFilePath
                })>
            Function(DocumentFileInfoRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DocumentFileInfoProvider._internal(
        (ref) => create(ref as DocumentFileInfoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        file: file,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<
      ({
        String? title,
        String? author,
        String? coverImagePath,
        String? newFilePath
      })> createElement() {
    return _DocumentFileInfoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DocumentFileInfoProvider &&
        other.file == file &&
        other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, file.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DocumentFileInfoRef on AutoDisposeFutureProviderRef<
    ({
      String? title,
      String? author,
      String? coverImagePath,
      String? newFilePath
    })> {
  /// The parameter `file` of this provider.
  File get file;

  /// The parameter `type` of this provider.
  BookType get type;
}

class _DocumentFileInfoProviderElement extends AutoDisposeFutureProviderElement<
    ({
      String? title,
      String? author,
      String? coverImagePath,
      String? newFilePath
    })> with DocumentFileInfoRef {
  _DocumentFileInfoProviderElement(super.provider);

  @override
  File get file => (origin as DocumentFileInfoProvider).file;
  @override
  BookType get type => (origin as DocumentFileInfoProvider).type;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
