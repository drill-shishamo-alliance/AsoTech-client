import 'package:equatable/equatable.dart';


class ListHuman extends Equatable {
  final num remaining_human;

  ListHuman(this.remaining_human) : super([remaining_human]);
}