import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/blocs/internet_cubit.dart';

class Internet extends StatelessWidget {
  const Internet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is NotConnectedState) {
          Text(state.message);
        }
      },
      builder: (context, state) {
        if (state is ConnectedState) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
          );
        } else if (state is NotConnectedState) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(fontSize: 20, color: Colors.redAccent),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
