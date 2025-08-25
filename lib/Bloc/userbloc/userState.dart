import 'package:equatable/equatable.dart';
import 'package:my_bloc_work/models/UserModel.dart';

class Userstate extends Equatable {
  final bool isloading;
  final List<Usermodel> users;
// constructor ..
  const Userstate({required this.isloading, required this.users});

// for change the state of variable ..
  Userstate copyWith({bool? isloading, List<Usermodel>? users}) => Userstate(
      isloading: isloading ?? this.isloading, users: users ?? this.users);

  // declear initial value ...

  static Userstate initialState() => const Userstate(isloading: false, users: []);

// equatable method ...
  @override
  List<Object?> get props => [isloading, users];
}
