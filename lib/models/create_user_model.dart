import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
part 'create_user_model.g.dart';

abstract class CreateUserModel
    implements Built<CreateUserModel, CreateUserModelBuilder> {
  String get name;
  String get job;

  CreateUserModel._();
  factory CreateUserModel([void Function(CreateUserModelBuilder) updates]) =
      _$CreateUserModel;

  static Serializer<CreateUserModel> get serializer =>
      _$createUserModelSerializer;
}
