import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc_work/Bloc/userbloc/userBloc.dart';
import 'package:my_bloc_work/Bloc/userbloc/userEvent.dart';
import 'package:my_bloc_work/models/UserModel.dart';

import '../../Bloc/userbloc/userState.dart';
 
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // when successfully loged in then load the all user at user interface ..
      create: (context) => Userbloc()..add(loadUserEvent()),
      child: Scaffold(
          appBar: AppBar(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person),
                SizedBox(width: 10),
                Text('User From API'),
              ],
            ),
            centerTitle: true,
          ),
          body: BlocBuilder<Userbloc, Userstate>(builder: (context, state) {
            // loading start ..
            if (state.isloading) {
              return const Center(
                  child: CircularProgressIndicator(color: Colors.white));
            }
            // ir user not found ...
            if (state.users.isEmpty) {
              return const Center(child: Text('User not found '));
            }

            // store all users from state
            List<Usermodel> allusers = state.users;

            return ListView.builder(
              itemCount: allusers.length,
              itemBuilder: (context, index) {
                Usermodel user = allusers[index];
                return ListTile(
                  leading: Text(user.id.toString()),
                  title: Text('${user.firstname} ${user.lastname}'),
                  subtitle: Text('Age : ${user.age.toString()}'),
                );
              },
            );
          })),
    );
  }
}
