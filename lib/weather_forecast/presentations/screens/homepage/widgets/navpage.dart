import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:weather_app/weather_forecast/presentations/screens/homepage/homepage.dart';
import 'package:weather_app/weather_forecast/presentations/screens/profilepage.dart';
import 'package:weather_app/weather_forecast/presentations/screens/searchpage.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key});

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  final pages = [
    const HomePage(),
    const SearchPage(),
    const ProfilePage()
  ];

  int pageIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: Container(
                height: 70,
                width: 150,
                padding: const EdgeInsets.all(12),
                margin:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(onPressed: (){
                      setState(() {
                        pageIndex = 0;
                      });
                    }, icon: pageIndex == 0 ? const Icon(Iconsax.home, color: Color.fromRGBO(11, 12, 30, 1), size: 28,): const Icon(Iconsax.home, color: Color.fromRGBO(11, 12, 30, 0.7), size: 20,)),

                    IconButton(onPressed: (){
                      setState(() {
                        pageIndex = 1;
                      });
                    }, icon: pageIndex == 1 ? const Icon(Iconsax.search_normal, color: Color.fromRGBO(11, 12, 30, 1), size: 28,): const Icon(Iconsax.search_normal, color: Color.fromRGBO(11, 12, 30, 0.7), size: 20,)),

                    IconButton(onPressed: (){
                      setState(() {
                        pageIndex = 2;
                      });
                    }, icon: pageIndex == 2 ? const Icon(Iconsax.user, color: Color.fromRGBO(11, 12, 30, 1), size: 28,): const Icon(Iconsax.user, color: Color.fromRGBO(11, 12, 30, 0.7), size: 20,)),
                  ],
                ),
              )
    );
  }
}