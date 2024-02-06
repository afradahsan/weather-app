import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/themes/text_theme.dart';
import 'package:weather_app/utils/themes/themes.dart';
import 'package:weather_app/weather_forecast/bloc/weather_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherSuccess) {
            debugPrint(state.weather.weatherDescription);
            return Scaffold(
              appBar: AppBar(
                primary: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Row(
                  children: [
                    const Icon(
                      Icons.location_pin,
                      size: 14,
                    ),
                    Text('${state.weather.areaName}, ${state.weather.country}'),
                  ],
                ),
                actions: const [
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.dark_mode),
                  )
                ],
              ),
              body: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 8, 15, 0),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-0.5, -0.8),
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.orange, shape: BoxShape.circle),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.5, -0.8),
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.blue, shape: BoxShape.circle),
                      ),
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.transparent),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          'Today\'s Report!',
                          style: KTextTheme.darkTextTheme.headlineMedium,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: Image.asset(
                          'assets/images/sun_thunder.png',
                          height: 120,
                        )),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${state.weather.temperature!.celsius!.round()}°C',
                          style: const TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          state.weather.weatherDescription!.capitalize(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20,),
                        Row(children: [
                          Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Image.asset('assets/images/8167912.webp', height: 40,),
                              Text('Wind Speed', style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),),
                              Text('${(state.weather.windSpeed!*3.6).roundToDouble()}km/h', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
                            ],),
                          )
                        ],)
                      ],
                    )
                  ],
                ),
              )),
            );
          } else {
            return const CircularProgressIndicator(
              color: Colors.brown,
            );
          }
        },
      )),
    );
  }
}
