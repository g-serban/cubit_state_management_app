import 'package:equatable/equatable.dart';

abstract class CubitStates extends Equatable {}
// abstract class = another class can extend this class as well


// we initialize every cubit app with an initialState
class InitialState extends CubitStates {
  // here we put the data that should be changed , states should hold data
  @override
  List<Object> get props => [];
}

// once we initialize InitialState, we want to trigger a new state called WelcomeState
class WelcomeState extends CubitStates {
  @override
  List<Object> get props => [];
}

// will be triggered when you are trying to load the data (-> circular indicator)
class LoadingState extends CubitStates {
  @override
  List<Object> get props => [];
}


// triggered once the data has been loaded successfully
class LoadedState extends CubitStates {
  @override
  List<Object> get props => [];
}
