library;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/serializer.dart';
import 'package:usermanagementapp/models/create_user_model.dart';
import 'package:usermanagementapp/models/model.dart';
part 'serializers.g.dart';

@SerializersFor([ViewUsersListsModel, UsersList, Support, CreateUserModel])
final Serializers serializers =
    (_$serializers.toBuilder()
          ..addBuilderFactory(
            const FullType(BuiltList, [FullType(ViewUsersListsModel)]),
            () => ListBuilder<ViewUsersListsModel>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, [FullType(UsersList)]),
            () => ListBuilder<UsersList>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, [FullType(Support)]),
            () => ListBuilder<Support>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, [FullType(CreateUserModel)]),
            () => ListBuilder<CreateUserModel>(),
          )
          ..addPlugin(StandardJsonPlugin()))
        .build();

BuiltList<T> deserializeList<T>(String body) {
  final decodedBody = json.decode(body) as Iterable;
  final l = decodedBody.map<T>((value) {
    return serializers.deserialize(value, specifiedType: FullType(T))! as T;
  });
  return BuiltList.from(l.toList());
}
