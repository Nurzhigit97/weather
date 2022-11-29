import 'package:flutter/material.dart';

class ForecastCard extends StatelessWidget {
  ForecastCard({
    super.key,
    required this.forecast,
  });

  List<dynamic>? forecast;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                'Today',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: forecast!.length,
              itemBuilder: (BuildContext ctx, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 100,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${forecast![index]['time'].split(' ').last}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Image.network(
                          'https:${forecast![index]['condition']['icon']}',
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${forecast![index]['temp_c'].toInt()}°',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
