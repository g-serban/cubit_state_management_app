import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit_logic.dart';
import 'package:flutter_cubit/cubit/app_cubits.dart';
import 'package:flutter_cubit/pages/detail_page.dart';
import 'package:flutter_cubit/pages/navpages/main_page.dart';
import 'package:flutter_cubit/services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cubit State Management App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubits>(
        create: (context) => AppCubits(
          data: DataServices(),
        ), // create the cubit
        // we pass a child that holds all the cubits or that can check them
        child: AppCubitLogic(), // show the logic
        // based on this, do conditional checks 
        ),
    );
  }
}
