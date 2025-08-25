import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc_work/Bloc/loginbloc/loginBloc.dart';
import 'package:my_bloc_work/Bloc/loginbloc/loginEvent.dart';
import 'package:my_bloc_work/Bloc/loginbloc/loginStatus.dart';
import 'package:my_bloc_work/screens/homeScreen/homescreen.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  late final TextEditingController _username;
  late final TextEditingController _password;

  @override
  void initState() {
    _username = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // for state changing we use bloclistener ..
    return BlocListener<Loginbloc, Loginstate>(
      listenWhen: (previous, current) =>
          previous.isSuccess != current.isSuccess,
      listener: (context, state) {
        if (state.isSuccess) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const Homescreen()));
        }
      },
      child: Scaffold(
        appBar: AppBar(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person),
                SizedBox(width: 10),
                Text('Api User Login page'),
              ],
            ),
            centerTitle: true),
        body: Center(
          child: SizedBox(
            width: 250,
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'To show the api users please login .. ',
                  style: TextStyle(fontSize: 23),
                ),
                const SizedBox(height: 20),

                // textfield for username ..
                TextField(
                  controller: _username,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter emilys ',
                  ),
                ),
                const SizedBox(height: 10),
                // textfield for password ..
                TextField(
                  controller: _password,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter emilyspass  ',
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<Loginbloc>().add(loginUserEvent(
                          username: _username.text, password: _password.text));
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: BlocBuilder<Loginbloc, Loginstate>(
                        buildWhen: (previous, current) =>
                            previous.isloading != current.isloading,
                        builder: (context, state) {
                          // loading start ..
                          if (state.isloading) {
                            return const CircularProgressIndicator(
                                color: Colors.white);
                          }

                          return const Text('Login');
                        }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
