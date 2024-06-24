import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/helper/weather_helper.dart';
import 'package:sky_scrapper/models/weather_model.dart';
import 'package:sky_scrapper/controller/serch_provider.dart';
import 'package:sky_scrapper/controller/theme_providers.dart';
import 'package:sky_scrapper/utils/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    dynamic themePro = Provider.of<ThemeProviders>(context);
    TextEditingController textController = TextEditingController();
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Consumer<SerchProvier>(builder: (context, provider, _) {
            return FutureBuilder(
              future: WeatherHelper.wHelper
                  .getWeatherData(cityName: provider.cityName),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  Weather? weather = snapShot.data;
                  return Stack(
                    children: [
                      SizedBox(
                        height: h,
                        width: w,
                        // 'assets/image/2.jpg'
                        child: Image.asset(
                          themePro.isDark
                              ? 'assets/image/2.jpg'
                              : 'assets/image/11.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 45, right: 8, left: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      weather!.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        themePro.isDark = !themePro.isDark;
                                      },
                                      icon: themePro.isDark
                                          ? const Icon(
                                              Icons.light_mode,
                                              size: 34,
                                              color: Colors.white,
                                            )
                                          : const Icon(
                                              Icons.dark_mode_rounded,
                                              size: 34,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              TextField(
                                controller: textController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  hintText: "Enter City",
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      provider.cityName = textController.text;

                                      provider.notify();
                                    },
                                    icon: const Icon(Icons.search),
                                  ),
                                ),
                                onSubmitted: (val) {
                                  provider.cityName = val;
                                },
                              ),
                              SizedBox(
                                height: h * 0.04,
                              ),
                              SizedBox(
                                height: h * 0.001,
                              ),
                              SizedBox(height: h * 0.01),
                              Text(
                                "${weather.main['temp'].toInt() - 273}°C",
                                style: GoogleFonts.fjallaOne(fontSize: 80),
                              ),
                              SizedBox(height: h * 0.001),
                              Text(
                                "${days[DateTime.now().weekday]},${DateTime.now().day} ${months[DateTime.now().month]}",
                                style: const TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                              const Divider(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'assets/image/10.png',
                                            width: 60,
                                          ),
                                          SizedBox(height: h * 0.01),
                                          Text(
                                            "${weather.wind['speed'].toStringAsFixed(1)} km/h",
                                            style: GoogleFonts.fjallaOne(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(height: h * 0.01),
                                          const Text(
                                            "Wind",
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'assets/image/9.gif',
                                            width: 40,
                                          ),
                                          SizedBox(height: h * 0.01),
                                          Text(
                                            "${weather.main['pressure'].toStringAsFixed(1)} km/h",
                                            style: GoogleFonts.fjallaOne(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(height: h * 0.01),
                                          const Text(
                                            "Pressure",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(),
                              SizedBox(height: h * 0.02),
                              Text(
                                "Visibility : ${weather.visibility}m",
                                style: GoogleFonts.fjallaOne(
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (snapShot.hasError) {
                  return Text(" Error :- ${snapShot.hasError}");
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            );
          }),
        ),
      ),
    );
  }
}
