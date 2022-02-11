// this file should hold the states and check them

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit_states.dart';
import 'package:flutter_cubit/cubit/app_cubits.dart';
import 'package:flutter_cubit/pages/home_page.dart';
import 'package:flutter_cubit/pages/welcome_page.dart';

class AppCubitLogic extends StatefulWidget {
  AppCubitLogic({Key? key}) : super(key: key);

  @override
  State<AppCubitLogic> createState() => _AppCubitLogicState();
}

class _AppCubitLogicState extends State<AppCubitLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(// checks the states
          // BlocBuilder has to know about cubits and states, hence  BlocBuilder<AppCubits, CubitStates>
          builder: (context, state) {
        // al builders in Flutter take a builder with a function
        // and I just realized that stuff: (stuff, stuff) {} is basically just an anonymous function with its arguments declared, kuddos to me I guess
        if (state is WelcomeState) {
          return const WelcomePage(); // trigger a new page using this cubit
        } else if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LoadedState) {
          return HomePage();
        } else {
          return Container(); // basically works like a route redirect, go here or there
        }
      }),
    );
  }
}
