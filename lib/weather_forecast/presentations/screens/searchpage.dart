import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weather_forecast/bussiness_logic/bloc/search_bloc/search_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController cityController = TextEditingController();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
          return Column(
            children: [
              TextField(
                controller: cityController,
                onSubmitted: (cityController) {
                  debugPrint('submitted');
                  BlocProvider.of<SearchBloc>(context)
                          .add(FetchWeatherbyCity(cityController.toString().trim()));}),
                  if (state is SearchSuccess)
                    Column(
                      children: [
                        (Text(state.weather.tempFeelsLike.toString())),
                      ],
                    ),
            ],
          );
        }),
      )),
    );
  }
}
