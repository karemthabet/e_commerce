import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/constants/app_constants.dart';
import '../cashed/prefs.dart';
import 'theme_cubit_state.dart';

class ThemeCubit extends Cubit<ThemeCubitState> {
  ThemeCubit() : super(ThemeCubitInitial());

  void getCurrentTheme() {
    bool isDark = Prefs.getBool(AppConstants.kIsDarkMode);
    if (isDark) {
      emit(DarkThemeState());
    } else {
      emit(LightThemeState());
    }
  }

  void toggleTheme() {
    Prefs.setBool(AppConstants.kIsDarkMode, !Prefs.getBool(AppConstants.kIsDarkMode));
    getCurrentTheme();
  }
}
