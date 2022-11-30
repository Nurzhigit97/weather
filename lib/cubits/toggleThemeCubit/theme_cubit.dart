import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:weather_api/cubits/setting_state.dart';

//! Cubit будет получать свойства из SettingState
class ThemeCubit extends Cubit<SettingState> {
  //! с помощью super получаем доступ к isToggle и устанавливаем зн. по умолчанию true
  ThemeCubit() : super(SettingState(isToggle: false));
  //! Method для переключения темы
  void toggleTheme({required bool value}) {
    //! переключаем зн. в class SettingState isToggle на false etc
    final updateToggleState = SettingState(isToggle: !value);
    //! обновляет зн.
    emit(updateToggleState);
  }
}
