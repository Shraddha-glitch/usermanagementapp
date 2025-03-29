// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CreateUserModel> _$createUserModelSerializer =
    new _$CreateUserModelSerializer();

class _$CreateUserModelSerializer
    implements StructuredSerializer<CreateUserModel> {
  @override
  final Iterable<Type> types = const [CreateUserModel, _$CreateUserModel];
  @override
  final String wireName = 'CreateUserModel';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    CreateUserModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'job',
      serializers.serialize(object.job, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  CreateUserModel deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new CreateUserModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'job':
          result.job =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
      }
    }

    return result.build();
  }
}

class _$CreateUserModel extends CreateUserModel {
  @override
  final String name;
  @override
  final String job;

  factory _$CreateUserModel([void Function(CreateUserModelBuilder)? updates]) =>
      (new CreateUserModelBuilder()..update(updates))._build();

  _$CreateUserModel._({required this.name, required this.job}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'CreateUserModel', 'name');
    BuiltValueNullFieldError.checkNotNull(job, r'CreateUserModel', 'job');
  }

  @override
  CreateUserModel rebuild(void Function(CreateUserModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateUserModelBuilder toBuilder() =>
      new CreateUserModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateUserModel && name == other.name && job == other.job;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, job.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateUserModel')
          ..add('name', name)
          ..add('job', job))
        .toString();
  }
}

class CreateUserModelBuilder
    implements Builder<CreateUserModel, CreateUserModelBuilder> {
  _$CreateUserModel? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _job;
  String? get job => _$this._job;
  set job(String? job) => _$this._job = job;

  CreateUserModelBuilder();

  CreateUserModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _job = $v.job;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateUserModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateUserModel;
  }

  @override
  void update(void Function(CreateUserModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateUserModel build() => _build();

  _$CreateUserModel _build() {
    final _$result =
        _$v ??
        new _$CreateUserModel._(
          name: BuiltValueNullFieldError.checkNotNull(
            name,
            r'CreateUserModel',
            'name',
          ),
          job: BuiltValueNullFieldError.checkNotNull(
            job,
            r'CreateUserModel',
            'job',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
