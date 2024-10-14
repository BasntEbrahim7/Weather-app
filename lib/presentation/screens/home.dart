import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/presentation/screens/weather_screen.dart';

import '../../business_logic/weather_cubit.dart';

class WeatherSearchScreen extends StatelessWidget {
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Stack for layering background image and other widgets
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'test/wall5.jpeg', // Replace with your actual image asset path
              fit: BoxFit.cover,
            ),
          ),
          // Foreground content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 40),
                Text(
                  'Welcome !',
                  style: GoogleFonts.adamina(
                    textStyle: TextStyle(
                      color: Colors.lightBlue.shade100,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _cityController,
                  decoration: InputDecoration(
                    labelText: 'Enter City Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.lightBlue.shade100),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.lightBlue.shade100, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.lightBlue.shade100, width: 1.5),
                    ),
                    labelStyle: TextStyle(color: Colors.lightBlue.shade100),
                  ),style: TextStyle(color: Colors.lightBlue.shade100),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    final city = _cityController.text;
                    if (city.isNotEmpty) {
                      // Fetch the weather and navigate to the WeatherInfoScreen
                      context.read<WeatherCubit>().fetchWeather(city).then((_) {
                        final state = context.read<WeatherCubit>().state;
                        if (state is WeatherLoaded) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WeatherInfoScreen(weather: state.weather),
                            ),
                          );
                        } else if (state is WeatherError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)),
                          );
                        }
                      });
                    }
                  },
                  child: Text('Check Weather',style: TextStyle(color: Colors.lightBlue.shade100,fontWeight: FontWeight.bold,fontSize: 25),),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.lightBlue.shade100, backgroundColor: Colors.black, // Text color
                    elevation: 5, // Elevation (shadow)
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Padding inside the button
                  ),

                ),
                SizedBox(height: 32),
                BlocBuilder<WeatherCubit, WeatherState>(
                  builder: (context, state) {
                    if (state is WeatherLoading) {
                      return CircularProgressIndicator();
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
