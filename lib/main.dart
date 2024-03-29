import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/utils/themes/themes.dart';
import 'package:weather_app/weather_forecast/bussiness_logic/bloc/bloc/weather_bloc.dart';
import 'package:weather_app/weather_forecast/bussiness_logic/bloc/search_bloc/search_bloc.dart';
import 'package:weather_app/weather_forecast/presentations/screens/homepage/widgets/navpage.dart';
import 'package:weather_app/weather_forecast/presentations/screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: KAppTheme.lightTheme,
        darkTheme: KAppTheme.darkTheme,
        home: FutureBuilder(
            future: _determinePosition(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider<WeatherBloc>(
                      create: (context) => WeatherBloc()
                        ..add(FetchWeather(snapshot.data as Position)),
                    ),
                    BlocProvider<SearchBloc>(
                      create: (context) => SearchBloc()
                    ),
                  ],
                  child: const NavBarPage(),
                );
              } else {
                return const SplashScreen();
              }
            }));
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    await Geolocator.requestPermission();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      print('not enabled');
      _enableLocation();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        debugPrint(' Permissions are denied');
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      debugPrint('denied forever');
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  _enableLocation() async {
    await Geolocator.openLocationSettings();
    await Geolocator.getCurrentPosition();
  }
}