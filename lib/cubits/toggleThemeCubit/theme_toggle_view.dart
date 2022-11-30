import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/cubits/setting_state.dart';
import 'package:weather_api/cubits/toggleThemeCubit/theme_cubit.dart';

class ThemeToggleView extends StatelessWidget {
  const ThemeToggleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, SettingState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            // BlocProvider.of<ThemeCubit>(context)
            //     .toggleTheme(value: !state);
            final cubit = context.read<ThemeCubit>();
            cubit.toggleTheme(value: state.isToggle);
          },
          icon: state.isToggle
              ? Icon(Icons.mode_night_rounded)
              : Icon(Icons.light_mode),
        );
      },
    );
  }
}
