part of 'theme_manager_bloc.dart';

@immutable
sealed class ThemeManagerState {}

final class ThemeManagerInitial extends ThemeManagerState {}

class LightModeState extends ThemeManagerState {}

class DarkModeState extends ThemeManagerState {}
