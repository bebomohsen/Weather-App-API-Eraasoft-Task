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
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage('assets/images/${cubit.statusImage}.gif'),
                      fit: BoxFit.cover)),
              child: cubit.weatherData == null
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            color: Colors.white,
                          ),
                          Text(
                            'Loading',
                            style: TextStyle(color: Colors.white, fontSize: 50),
                          )
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(11, 50, 11, 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          cubit.needSearchBar
                              ? FittedBox(
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextField(
                                              autofocus: true,
                                              style: TextStyle(
                                                  color: Colors.white),
                                              controller: cubit.txtController,
                                              decoration: InputDecoration(
                                                  labelStyle: TextStyle(
                                                      color: Colors.blueAccent),
                                                  hintStyle: TextStyle(
                                                      color: Colors.white),
                                                  labelText: 'Country',
                                                  hintText:
                                                      'Enter Country Name')),
                                        ),
                                        ElevatedButton(
                                            onPressed: cubit.selectCountry,
                                            child: Text('OK'))
                                      ],
                                    ),
                                  ),
                                )
                              : InkWell(
                                  onTap: cubit.enableSearchBar,
                                  child: Text(
                                    cubit.weatherData!.name!,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 50),
                                  ),
                                ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    cubit.weatherData!.main!.feelsLike!
                                        .round()
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 170),
                                  ),
                                  Text(
                                    '°',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 130),
                                  ),
                                ],
                              ),
                              RotatedBox(
                                  quarterTurns: 3,
                                  child: Text(
                                    cubit.weatherData!.weather![0].main!,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 35),
                                  ))
                            ],
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.white12,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      cubit.weatherData!.wind!.speed.toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    Text(
                                      'Wind Speed',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    Text(
                                      cubit.weatherData!.main!.humidity
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    Text(
                                      'Humidity',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    Text(
                                      cubit.weatherData!.main!.pressure!
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    Text(
                                      'Pressure',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
