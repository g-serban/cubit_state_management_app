import 'package:bloc/bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit_states.dart';
import 'package:flutter_cubit/model/data_model.dart';
import 'package:flutter_cubit/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  // <CubitStates> is how cubit knows about the state classes
  final DataServices data;
  late final places;

  AppCubits({required this.data}) : super(InitialState()) {
    // after initializing the state, we want to emit a new state (the welcome page in our case)
    emit(WelcomeState());
  }

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      // once the data is loaded, execute the next line
      emit(LoadedState(places));
    } catch (e) {}
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
