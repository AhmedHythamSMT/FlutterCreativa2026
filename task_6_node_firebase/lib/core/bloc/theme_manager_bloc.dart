// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'theme_manager_event.dart';
part 'theme_manager_state.dart';

class ThemeManagerBloc extends Bloc<ThemeManagerEvent, ThemeManagerState> {
  ThemeManagerBloc() : super(ThemeManagerInitial()) {
    on<LightModeEvent>((event, emit) {
      emit(LightModeState());
    });
  }
}
