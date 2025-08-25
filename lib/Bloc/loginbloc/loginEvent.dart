import 'package:equatable/equatable.dart';

abstract class Loginevent extends Equatable {
  @override
  List<Object?> get props => [];
}


class loginUserEvent extends Loginevent {
  final String username;
  final String password;

  loginUserEvent({required this.username, required this.password});
}
