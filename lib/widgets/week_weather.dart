import 'package:flutter/material.dart';
import 'package:weather_api/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class WeekWeather extends StatelessWidget {
  WeekWeather({
    Key? key,
    required this.forecastdata,
  }) : super(key: key);

  List<dynamic>? forecastdata;
  List<String> weekList = [
    LocaleKeys.weekMap_monday.tr(),
    LocaleKeys.weekMap_tuesday.tr(),
    LocaleKeys.weekMap_wednesday.tr(),
    LocaleKeys.weekMap_thursday.tr(),
    LocaleKeys.weekMap_friday.tr(),
    LocaleKeys.weekMap_saturday.tr(),
    LocaleKeys.weekMap_sunday.tr(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(50, 0, 16, 38),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.week.tr(),
                style: TextStyle(fontSize: 20),
              ),
              Row(
                children: const [
                  Text(
                    'Max',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Min',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 110,
                height: 450,
                child: ListView.builder(
                  itemCount: weekList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 24, bottom: 22),
                          child: Text(
                            weekList[index],
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: 450,
                  child: ListView.builder(
                    itemCount: forecastdata!.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(
                            'https:${forecastdata![index]['day']['condition']['icon']}',
                            fit: BoxFit.cover,
                          ),
                          Row(
                            children: [
                              Text(
                                '${forecastdata![index]['day']['maxtemp_c']}°',
                                style: const TextStyle(fontSize: 15),
                              ),
                              const SizedBox(
                                width: 11,
                              ),
                              Text(
                                ' ${forecastdata![index]['day']['mintemp_c']}°',
                                style: const TextStyle(fontSize: 15),
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
