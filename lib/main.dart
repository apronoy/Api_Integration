import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc_work/Bloc/loginbloc/loginBloc.dart';
import 'package:my_bloc_work/data/services/get_it.dart';
import 'package:my_bloc_work/screens/loginScreen/loginPage.dart';

void main() {
  // diclear with getit method ..
  setUpGetIT();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Loginbloc()),
      ],
      child: MaterialApp(
        title: 'Users App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 148, 110, 214)),
          useMaterial3: false,
        ),
        debugShowCheckedModeBanner: false,
        home: const Loginpage(),
      ),
    );
  }
}
