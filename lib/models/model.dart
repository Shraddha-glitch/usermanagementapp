import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
part 'model.g.dart';

abstract class ViewUsersListsModel
    implements Built<ViewUsersListsModel, ViewUsersListsModelBuilder> {
  int get page;
  int get per_page;
  int get total;
  int get total_pages;
  BuiltList<UsersList> get data;
  Support get support;

  ViewUsersListsModel._();

  factory ViewUsersListsModel([
    void Function(ViewUsersListsModelBuilder) updates,
  ]) = _$ViewUsersListsModel;

  static Serializer<ViewUsersListsModel> get serializer =>
      _$viewUsersListsModelSerializer;
}

abstract class UsersList implements Built<UsersList, UsersListBuilder> {
  int get id;
  String get email;
  String get first_name;
  String get last_name;
  String get avatar;

  UsersList._();

  factory UsersList([void Function(UsersListBuilder) updates]) = _$UsersList;

  static Serializer<UsersList> get serializer => _$usersListSerializer;
}

abstract class Support implements Built<Support, SupportBuilder> {
  String get url;
  String get text;

  Support._();
  factory Support([void Function(SupportBuilder) updates]) = _$Support;

  static Serializer<Support> get serializer => _$supportSerializer;
}
