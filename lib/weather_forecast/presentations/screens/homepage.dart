import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/utils/themes/text_theme.dart';
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
                    const Icon(Icons.location_pin, size: 14,),
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
              body: SafeArea(child: Column(children: [
                Text('Today\'s Report!', style: KTextTheme.darkTextTheme.headlineMedium,)
              ],)),
            );
          } else {
            return CircularProgressIndicator(color: Colors.brown,);
          }
        },
      )),
    );
  }
}
