
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:equatable/equatable.dart';
  
  part 'main_event.dart';
  part 'main_state.dart';
  
  class MainBloc extends Bloc<MainEvent, MainState> {
    MainBloc() : super(MainInitial()) {
      on<MainEvent>((event, emit) {
        // TODO: implement event handler
      });
    }
  }
