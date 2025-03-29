// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ViewUsersListsModel> _$viewUsersListsModelSerializer =
    new _$ViewUsersListsModelSerializer();
Serializer<UsersList> _$usersListSerializer = new _$UsersListSerializer();
Serializer<Support> _$supportSerializer = new _$SupportSerializer();

class _$ViewUsersListsModelSerializer
    implements StructuredSerializer<ViewUsersListsModel> {
  @override
  final Iterable<Type> types = const [
    ViewUsersListsModel,
    _$ViewUsersListsModel,
  ];
  @override
  final String wireName = 'ViewUsersListsModel';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ViewUsersListsModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'page',
      serializers.serialize(object.page, specifiedType: const FullType(int)),
      'per_page',
      serializers.serialize(
        object.per_page,
        specifiedType: const FullType(int),
      ),
      'total',
      serializers.serialize(object.total, specifiedType: const FullType(int)),
      'total_pages',
      serializers.serialize(
        object.total_pages,
        specifiedType: const FullType(int),
      ),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(BuiltList, const [
          const FullType(UsersList),
        ]),
      ),
      'support',
      serializers.serialize(
        object.support,
        specifiedType: const FullType(Support),
      ),
    ];

    return result;
  }

  @override
  ViewUsersListsModel deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new ViewUsersListsModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'page':
          result.page =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'per_page':
          result.per_page =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'total':
          result.total =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'total_pages':
          result.total_pages =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'data':
          result.data.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(UsersList),
                  ]),
                )!
                as BuiltList<Object?>,
          );
          break;
        case 'support':
          result.support.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(Support),
                )!
                as Support,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$UsersListSerializer implements StructuredSerializer<UsersList> {
  @override
  final Iterable<Type> types = const [UsersList, _$UsersList];
  @override
  final String wireName = 'UsersList';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    UsersList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'email',
      serializers.serialize(
        object.email,
        specifiedType: const FullType(String),
      ),
      'first_name',
      serializers.serialize(
        object.first_name,
        specifiedType: const FullType(String),
      ),
      'last_name',
      serializers.serialize(
        object.last_name,
        specifiedType: const FullType(String),
      ),
      'avatar',
      serializers.serialize(
        object.avatar,
        specifiedType: const FullType(String),
      ),
    ];

    return result;
  }

  @override
  UsersList deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new UsersListBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'email':
          result.email =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'first_name':
          result.first_name =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'last_name':
          result.last_name =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'avatar':
          result.avatar =
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

class _$SupportSerializer implements StructuredSerializer<Support> {
  @override
  final Iterable<Type> types = const [Support, _$Support];
  @override
  final String wireName = 'Support';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    Support object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Support deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new SupportBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'url':
          result.url =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'text':
          result.text =
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

class _$ViewUsersListsModel extends ViewUsersListsModel {
  @override
  final int page;
  @override
  final int per_page;
  @override
  final int total;
  @override
  final int total_pages;
  @override
  final BuiltList<UsersList> data;
  @override
  final Support support;

  factory _$ViewUsersListsModel([
    void Function(ViewUsersListsModelBuilder)? updates,
  ]) => (new ViewUsersListsModelBuilder()..update(updates))._build();

  _$ViewUsersListsModel._({
    required this.page,
    required this.per_page,
    required this.total,
    required this.total_pages,
    required this.data,
    required this.support,
  }) : super._() {
    BuiltValueNullFieldError.checkNotNull(page, r'ViewUsersListsModel', 'page');
    BuiltValueNullFieldError.checkNotNull(
      per_page,
      r'ViewUsersListsModel',
      'per_page',
    );
    BuiltValueNullFieldError.checkNotNull(
      total,
      r'ViewUsersListsModel',
      'total',
    );
    BuiltValueNullFieldError.checkNotNull(
      total_pages,
      r'ViewUsersListsModel',
      'total_pages',
    );
    BuiltValueNullFieldError.checkNotNull(data, r'ViewUsersListsModel', 'data');
    BuiltValueNullFieldError.checkNotNull(
      support,
      r'ViewUsersListsModel',
      'support',
    );
  }

  @override
  ViewUsersListsModel rebuild(
    void Function(ViewUsersListsModelBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ViewUsersListsModelBuilder toBuilder() =>
      new ViewUsersListsModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ViewUsersListsModel &&
        page == other.page &&
        per_page == other.per_page &&
        total == other.total &&
        total_pages == other.total_pages &&
        data == other.data &&
        support == other.support;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, page.hashCode);
    _$hash = $jc(_$hash, per_page.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, total_pages.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, support.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ViewUsersListsModel')
          ..add('page', page)
          ..add('per_page', per_page)
          ..add('total', total)
          ..add('total_pages', total_pages)
          ..add('data', data)
          ..add('support', support))
        .toString();
  }
}

class ViewUsersListsModelBuilder
    implements Builder<ViewUsersListsModel, ViewUsersListsModelBuilder> {
  _$ViewUsersListsModel? _$v;

  int? _page;
  int? get page => _$this._page;
  set page(int? page) => _$this._page = page;

  int? _per_page;
  int? get per_page => _$this._per_page;
  set per_page(int? per_page) => _$this._per_page = per_page;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  int? _total_pages;
  int? get total_pages => _$this._total_pages;
  set total_pages(int? total_pages) => _$this._total_pages = total_pages;

  ListBuilder<UsersList>? _data;
  ListBuilder<UsersList> get data =>
      _$this._data ??= new ListBuilder<UsersList>();
  set data(ListBuilder<UsersList>? data) => _$this._data = data;

  SupportBuilder? _support;
  SupportBuilder get support => _$this._support ??= new SupportBuilder();
  set support(SupportBuilder? support) => _$this._support = support;

  ViewUsersListsModelBuilder();

  ViewUsersListsModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _page = $v.page;
      _per_page = $v.per_page;
      _total = $v.total;
      _total_pages = $v.total_pages;
      _data = $v.data.toBuilder();
      _support = $v.support.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ViewUsersListsModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ViewUsersListsModel;
  }

  @override
  void update(void Function(ViewUsersListsModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ViewUsersListsModel build() => _build();

  _$ViewUsersListsModel _build() {
    _$ViewUsersListsModel _$result;
    try {
      _$result =
          _$v ??
          new _$ViewUsersListsModel._(
            page: BuiltValueNullFieldError.checkNotNull(
              page,
              r'ViewUsersListsModel',
              'page',
            ),
            per_page: BuiltValueNullFieldError.checkNotNull(
              per_page,
              r'ViewUsersListsModel',
              'per_page',
            ),
            total: BuiltValueNullFieldError.checkNotNull(
              total,
              r'ViewUsersListsModel',
              'total',
            ),
            total_pages: BuiltValueNullFieldError.checkNotNull(
              total_pages,
              r'ViewUsersListsModel',
              'total_pages',
            ),
            data: data.build(),
            support: support.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
        _$failedField = 'support';
        support.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
          r'ViewUsersListsModel',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UsersList extends UsersList {
  @override
  final int id;
  @override
  final String email;
  @override
  final String first_name;
  @override
  final String last_name;
  @override
  final String avatar;

  factory _$UsersList([void Function(UsersListBuilder)? updates]) =>
      (new UsersListBuilder()..update(updates))._build();

  _$UsersList._({
    required this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.avatar,
  }) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'UsersList', 'id');
    BuiltValueNullFieldError.checkNotNull(email, r'UsersList', 'email');
    BuiltValueNullFieldError.checkNotNull(
      first_name,
      r'UsersList',
      'first_name',
    );
    BuiltValueNullFieldError.checkNotNull(last_name, r'UsersList', 'last_name');
    BuiltValueNullFieldError.checkNotNull(avatar, r'UsersList', 'avatar');
  }

  @override
  UsersList rebuild(void Function(UsersListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersListBuilder toBuilder() => new UsersListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersList &&
        id == other.id &&
        email == other.email &&
        first_name == other.first_name &&
        last_name == other.last_name &&
        avatar == other.avatar;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, first_name.hashCode);
    _$hash = $jc(_$hash, last_name.hashCode);
    _$hash = $jc(_$hash, avatar.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersList')
          ..add('id', id)
          ..add('email', email)
          ..add('first_name', first_name)
          ..add('last_name', last_name)
          ..add('avatar', avatar))
        .toString();
  }
}

class UsersListBuilder implements Builder<UsersList, UsersListBuilder> {
  _$UsersList? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _first_name;
  String? get first_name => _$this._first_name;
  set first_name(String? first_name) => _$this._first_name = first_name;

  String? _last_name;
  String? get last_name => _$this._last_name;
  set last_name(String? last_name) => _$this._last_name = last_name;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  UsersListBuilder();

  UsersListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _email = $v.email;
      _first_name = $v.first_name;
      _last_name = $v.last_name;
      _avatar = $v.avatar;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersList;
  }

  @override
  void update(void Function(UsersListBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersList build() => _build();

  _$UsersList _build() {
    final _$result =
        _$v ??
        new _$UsersList._(
          id: BuiltValueNullFieldError.checkNotNull(id, r'UsersList', 'id'),
          email: BuiltValueNullFieldError.checkNotNull(
            email,
            r'UsersList',
            'email',
          ),
          first_name: BuiltValueNullFieldError.checkNotNull(
            first_name,
            r'UsersList',
            'first_name',
          ),
          last_name: BuiltValueNullFieldError.checkNotNull(
            last_name,
            r'UsersList',
            'last_name',
          ),
          avatar: BuiltValueNullFieldError.checkNotNull(
            avatar,
            r'UsersList',
            'avatar',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

class _$Support extends Support {
  @override
  final String url;
  @override
  final String text;

  factory _$Support([void Function(SupportBuilder)? updates]) =>
      (new SupportBuilder()..update(updates))._build();

  _$Support._({required this.url, required this.text}) : super._() {
    BuiltValueNullFieldError.checkNotNull(url, r'Support', 'url');
    BuiltValueNullFieldError.checkNotNull(text, r'Support', 'text');
  }

  @override
  Support rebuild(void Function(SupportBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SupportBuilder toBuilder() => new SupportBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Support && url == other.url && text == other.text;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Support')
          ..add('url', url)
          ..add('text', text))
        .toString();
  }
}

class SupportBuilder implements Builder<Support, SupportBuilder> {
  _$Support? _$v;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  SupportBuilder();

  SupportBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _url = $v.url;
      _text = $v.text;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Support other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Support;
  }

  @override
  void update(void Function(SupportBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Support build() => _build();

  _$Support _build() {
    final _$result =
        _$v ??
        new _$Support._(
          url: BuiltValueNullFieldError.checkNotNull(url, r'Support', 'url'),
          text: BuiltValueNullFieldError.checkNotNull(text, r'Support', 'text'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
