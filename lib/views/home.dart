import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapptask/blocs/weather_data/weather_data_cubit.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherDataCubit, WeatherDataState>(
      builder: (BuildContext context, state) {
        var cubit = WeatherDataCubit.get(context);
        return Scaffold(
          body: Container(
            color: Colors.amber,
            child: Center(
                child: Text(
              cubit.weatherData == null
                  ? 'loading'
                  : cubit.weatherData!.main!.feelsLike.toString(),
              style: TextStyle(fontSize: 100),
            )),
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
