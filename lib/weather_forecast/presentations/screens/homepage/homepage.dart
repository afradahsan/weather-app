import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/weather_forecast/bussiness_logic/bloc/bloc/weather_bloc.dart';
import 'package:weather_app/weather_forecast/presentations/screens/homepage/widgets/quick_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherSuccess) {
            debugPrint(state.weather.weatherDescription);
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title:
                    Text('${state.weather.areaName}, ${state.weather.country}'),
                actions: const [
                  Padding(
                    padding: EdgeInsets.only(right: 12.0),
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
                      alignment: const AlignmentDirectional(-0.5, -0.8),
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: const BoxDecoration(
                            color: Colors.orange, shape: BoxShape.circle),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.5, -0.8),
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: const BoxDecoration(
                            color: Colors.blue, shape: BoxShape.circle),
                      ),
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
                      child: Container(
                        decoration:
                            const BoxDecoration(color: Colors.transparent),
                      ),
                    ),
                    Column(
                      children: [
                        // Text(
                        //   'Today\'s Report!',
                        //   style: KTextTheme.darkTextTheme.headlineMedium,
                        // ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        Center(
                            child: Image.asset(
                          'assets/images/sun_thunder.png',
                          height: 140,
                        )),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                              text:
                                  '${state.weather.temperature!.celsius!.round()}',
                              style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 80,
                                  fontWeight: FontWeight.bold),),
                                TextSpan(
                                  text: '°C',
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.sortsMillGoudy().fontFamily,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontFeatures: [FontFeature.superscripts()]),
                                )
                              ]),
                        ),
                        Text(
                          state.weather.weatherDescription!.capitalize(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                QuickInfoWidget(
                                    image: 'assets/images/8167912.webp',
                                    text: 'Wind Speed',
                                    value:
                                        '${(state.weather.windSpeed! * 3.6).roundToDouble()}km/h'),
                                QuickInfoWidget(
                                    image:
                                        'assets/images/water-humidity-7847139-6293694.webp',
                                    text: 'Humidity',
                                    value:
                                        '${state.weather.humidity!.toInt()}%'),
                                QuickInfoWidget(
                                    image: 'assets/images/8167912.webp',
                                    text: 'Pressure',
                                    value:
                                        '${state.weather.pressure!.toInt()}hPa'),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                QuickInfoWidget(
                                    image: 'assets/images/8167912.webp',
                                    text: 'Sunrise',
                                    value: DateFormat()
                                        .add_jm()
                                        .format(state.weather.sunrise!)),
                                QuickInfoWidget(
                                    image:
                                        'assets/images/water-humidity-7847139-6293694.webp',
                                    text: 'Sunset',
                                    value: DateFormat()
                                        .add_jm()
                                        .format(state.weather.sunset!)),
                                QuickInfoWidget(
                                    image: 'assets/images/8167912.webp',
                                    text: 'Pressure',
                                    value:
                                        '${state.weather.pressure!.toInt()}hPa'),
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.brown,
              ),
            );
          }
        },
      )),
    );
  }
}
