import 'package:flutter/material.dart';

class WeekWeather extends StatelessWidget {
  WeekWeather({
    Key? key,
    required this.forecastdata,
  }) : super(key: key);

  List<dynamic>? forecastdata;
  List<String> week = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
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
              const Text(
                'Week',
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
                  itemCount: week.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 24, bottom: 22),
                          child: Text(
                            week[index],
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
