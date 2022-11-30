// import 'package:flutter/material.dart';
// import 'package:weather_api/cubits/toggleThemeCubit/theme_toggle_view.dart';
// import 'package:weather_api/generated/locale_keys.g.dart';
// import 'package:weather_api/models/weather_api.dart';
// import 'package:weather_api/repository/api_repository.dart';
// import 'package:weather_api/widgets/choose_lang.dart';
// import 'package:weather_api/widgets/forecast_card.dart';
// import 'package:weather_api/widgets/get_by_location.dart';
// import 'package:weather_api/widgets/header.dart';
// import 'package:weather_api/widgets/search.dart';
// import 'package:weather_api/widgets/select_city.dart';
// import 'package:weather_api/widgets/week_weather.dart';
// import 'package:easy_localization/easy_localization.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   WeatherRepository _weatherRepository = WeatherRepository();
//   Weather? weather = Weather();
//   bool _isLoadinf = true;

//   Future getWeather() async {
//     weather = await _weatherRepository.getAll();
//     setState(() {
//       getWeather();
//       _isLoadinf = false;
//     });
//   }

//   @override
//   void initState() {
//     getWeather();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(LocaleKeys.nameapp.tr()),
//           elevation: 0,
//           actions: [
//             ThemeToggleView(),
//             Padding(
//               padding: const EdgeInsets.only(
//                 right: 20,
//               ),
//               child: chooseLang(context),
//             ),
//             SelectCity(),
//             GetByLocation(),
//           ],
//         ),
//         body: _isLoadinf
//             ? const Center(
//                 child: SizedBox(
//                     width: 30, height: 30, child: CircularProgressIndicator()),
//               )
//             : ListView(
//                 children: [
//                   Search(),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 20, right: 20),
//                     child: Column(
//                       children: [
//                         Header(
//                             cityName: weather!.city,
//                             description: weather!.text,
//                             stateName: weather!.state,
//                             forecastday: weather!.forecastday,
//                             temp: weather!.temp),
//                         ForecastCard(
//                           forecast: weather!.forecast,
//                         ),
//                         WeekWeather(
//                           forecastdata: weather!.forecastdata,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }
// }
