import 'package:bloc/bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit_states.dart';

class AppCubits extends Cubit<CubitStates> {
  // <CubitStates> is how cubit knows about the state classes
  AppCubits() : super(InitialState()) {
    // after initializing the state, we want to emit a new state (the welcome page in our case)
    emit(WelcomeState());
  }

  void getData() {
    try {
      
    } catch(e) {

    }
  }
}
