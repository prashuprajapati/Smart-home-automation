import 'package:smarthome/config/size_config.dart';
import 'package:smarthome/src/screens/weather_screen/weather.dart';
import 'package:smarthome/view/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:smarthome/view/weather_cast_view.dart';

class WeatherContainer extends StatelessWidget {
  const WeatherContainer({Key? key, required this.model}) : super(key: key);

  final HomeScreenViewModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: getProportionateScreenHeight(100),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xFFFFFFFF),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10),
              vertical: getProportionateScreenHeight(6),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(90),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Weatherdata()));
                      }),
                      child: Column(
                        children: [
                          Text(
                            '28°C',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            'Cloudy',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(5),
                          ),
                          Text(
                            'Today',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(
                            'Bhopal,Madhyapradesh',
                            style: Theme.of(context).textTheme.headline5,
                          )
                        ],
                      ),
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                    side: BorderSide(
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255)))),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Image.asset(
          'assets/images/weather/0.png',
          height: getProportionateScreenHeight(110),
          width: getProportionateScreenWidth(140),
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
