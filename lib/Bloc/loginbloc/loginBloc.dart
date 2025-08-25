import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_bloc_work/Bloc/loginbloc/loginEvent.dart';
import 'package:my_bloc_work/Bloc/loginbloc/loginStatus.dart';
import 'package:my_bloc_work/data/repositories/authentication_repository.dart';
 
class Loginbloc extends Bloc<Loginevent, Loginstate> {
  final _authRepository = AuthenticationRepository();

  Loginbloc() : super(Loginstate.initialState()) {
    on<loginUserEvent>(_loginUser);
  }
// login user ..
  Future<void> _loginUser(
      loginUserEvent event, Emitter<Loginstate> emit) async {
    try {
      // start loading ..
      emit(state.copyWith(isloading: true, isSuccess: false));

      // login user ..
      await _authRepository.loginUser(event.username, event.password);
      debugPrint('Success ');
      //stop loading ..
      emit(state.copyWith(isloading: false, isSuccess: true));
    } catch (e) {
      debugPrint('Error while login : $e');
    }
  }
}
