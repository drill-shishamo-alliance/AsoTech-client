import 'package:equatable/equatable.dart';


class User extends Equatable {
    final num user_id;

  User(this.user_id) : super([user_id]);
}