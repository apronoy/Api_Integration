import 'package:equatable/equatable.dart';

class Loginstate extends Equatable {
  final bool isloading;
  final bool isSuccess;
  // constructor declear ..
  const Loginstate({required this.isloading, required this.isSuccess});
 
  // updating the variable state .. 
  Loginstate copyWith({bool? isloading, bool? isSuccess}) {
    return Loginstate(
        isloading: isloading ?? this.isloading,
        isSuccess: isSuccess ?? this.isSuccess);
  }

// for initialy value diclar ..
  static Loginstate initialState() {
    return const Loginstate(isloading: false, isSuccess: false);
  }

  @override
  List<Object?> get props => [isloading, isSuccess];
}
