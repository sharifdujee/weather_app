import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weathe_bloc.dart';
import 'package:weather_app/bloc/weathe_state.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300 :
        return Image.asset(
            'assets/images/1.png'
        );
      case >= 300 && < 400 :
        return Image.asset(
            'assets/images/2.png'
        );
      case >= 500 && < 600 :
        return Image.asset(
            'assets/images/3.png'
        );
      case >= 600 && < 700 :
        return Image.asset(
            'assets/images/4.png'
        );
      case >= 700 && < 800 :
        return Image.asset(
            'assets/images/5.png'
        );
      case == 800 :
        return Image.asset(
            'assets/images/6.png'
        );
      case > 800 && <= 804 :
        return Image.asset(
            'assets/images/7.png'
        );
      default:
        return Image.asset(
            'assets/images/8.png'
        );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.deepPurple),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFF673AB7)),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  height: 300,
                  width: 600,
                  decoration: const BoxDecoration(color: Color(0xFFFFAB40)),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1000.0, sigmaY: 100.0),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),
              BlocBuilder<WeatherBlocBloc, WeatherBlockState>(
                builder: (context, state) {
                  if (state is WeatherBlocSuccess) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(
                              '📍${state.weather.areaName}\n ${state.weather.country}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                             const Text(
                              'Welcome To Weather\nUpdate Apps',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                  fontSize: 25),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                              child:  Text(
                                ' Wind Speed is ${state.weather.windSpeed}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                    fontSize: 15),
                              ),
                            ),
                            getWeatherIcon(state.weather.weatherConditionCode!),
                             Center(
                              child: Text(
                                '${state.weather.temperature!.celsius!.round()}°C',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 55,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Center(
                              child: Text(
                                ' Feel Like ${state.weather.tempFeelsLike!.celsius!.round()}°C',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                             Center(
                              child: Text(
                                state.weather.weatherMain!.toUpperCase(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),

                            const SizedBox(
                              height: 5,
                            ),
                             Center(
                              child: Text(
                                DateFormat('EEEE dd .').add_jm().format(state.weather.date!),

                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/11.png',
                                      scale: 8,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    const Text(
                                      'Sunrise',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      DateFormat().add_jm().format(state.weather.sunrise!),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/12.png',
                                      scale: 8,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text(
                                      'Sunrise',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                        DateFormat().add_jm().format(state.weather.sunset!),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Divider(
                                color: Colors.grey,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/13.png',
                                      scale: 8,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${state.weather.tempMax!.celsius!.round()}°C',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'Temp MAX',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),

                                Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/14.png',
                                      scale: 8,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${state.weather.tempMin!.celsius!.round()}°C',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'Temp MIN',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
