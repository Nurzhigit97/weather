import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/blocs/theme_cubit.dart';

class ThemeToggleView extends StatelessWidget {
  const ThemeToggleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //! получаем кубит и из SettingState свойство isToggle

    final themeCubit = context.read<ThemeCubit>();
    return IconButton(
      onPressed: () {
        themeCubit.toggleTheme(value: themeCubit.state.isToggle!);
      },
      icon: themeCubit.state.isToggle!
          ? Icon(Icons.mode_night_rounded)
          : Icon(Icons.light_mode),
    );
  }
}
