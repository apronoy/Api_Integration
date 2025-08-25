import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_bloc_work/Bloc/userbloc/userEvent.dart';
import 'package:my_bloc_work/Bloc/userbloc/userState.dart';
import 'package:my_bloc_work/data/repositories/user_repository.dart';
import 'package:my_bloc_work/models/UserModel.dart';

class Userbloc extends Bloc<Userevent, Userstate> {
  final _userRepository = UserRepository();

  Userbloc() : super(Userstate.initialState()) {
    on<loadUserEvent>(_loadUsers);
  }

  Future<void> _loadUsers(loadUserEvent event, Emitter<Userstate> emit) async {
    try {
      // start loading ..
      emit(state.copyWith(isloading: true));

      //get all users ..
      List<Usermodel> allusers = await _userRepository.loadallUsers();

      // store/update users data into variable ..
      emit(state.copyWith(users: allusers));
    } catch (e) {
      debugPrint('Error while loading users :$e');
    } finally {
      emit(state.copyWith(isloading: false));
    }
  }
}
