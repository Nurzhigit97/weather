import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

DropdownButton<Locale> chooseLang(BuildContext context) =>
    DropdownButton<Locale>(
        underline: SizedBox.shrink(),
        //! End. InternetBloc
        icon: Icon(
          Icons.language_rounded,
          color: Color.fromARGB(255, 255, 255, 255),
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
