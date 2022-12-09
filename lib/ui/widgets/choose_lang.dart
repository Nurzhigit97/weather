import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/blocs/internet_cubit.dart';

DropdownButton<Locale> chooseLang(BuildContext context) =>
    DropdownButton<Locale>(
        underline: SizedBox.shrink(),
        //! End. InternetBloc
        icon: BlocConsumer<InternetCubit, InternetState>(
          listener: (context, state) {
            if (state is NotConnectedState) {
              Icon(
                Icons.language_rounded,
                color: Color.fromARGB(255, 168, 51, 43),
              );
            }
          },
          builder: (context, state) {
            if (state is ConnectedState) {
              return Icon(
                Icons.language_rounded,
                color: Color.fromARGB(255, 255, 255, 255),
              );
            } else if (state is NotConnectedState) {
              return Icon(
                Icons.language_rounded,
                color: Color.fromARGB(255, 168, 51, 43),
              );
            }
            return const SizedBox();
          },
        ),
        onChanged: (locale) {
          context.setLocale(locale ?? context.locale);
        },
        items: const [
          DropdownMenuItem(
            value: Locale('en'),
            child: Text(
              'EN',
            ),
          ),
          DropdownMenuItem(
            value: Locale('ru'),
            child: Text(
              'RU',
            ),
          ),
          DropdownMenuItem(
            value: Locale('ky'),
            child: Text('KG'),
          ),
        ],
        selectedItemBuilder: (context) {
          return [
            const Text(
              'EN',
            ),
            Text(
              'RU',
            ),
            Text(
              'KG',
            ),
          ];
        });
