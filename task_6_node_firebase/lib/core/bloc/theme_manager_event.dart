part of 'theme_manager_bloc.dart';

@immutable
sealed class ThemeManagerEvent {}

class LightModeEvent extends ThemeManagerEvent {}

class DarkModeEvent extends ThemeManagerEvent {}
