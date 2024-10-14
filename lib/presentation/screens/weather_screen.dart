import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/models/waether_data.dart';

class WeatherInfoScreen extends StatelessWidget {
  final WeatherModel weather;

  const WeatherInfoScreen({Key? key, required this.weather}) : super(key: key);

  // Function to get background image based on temperature
  String getBackgroundImage(double temp) {
    if (temp <= 10) {
      return 'test/cold.jpeg';  // Cold weather background
    } else if (temp > 10 && temp <= 30) {
      return 'test/warm.jpeg';  // Warm weather background
    } else {
      return 'test/hot.jpeg';   // Hot weather background
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              getBackgroundImage(weather.main.temp),
              fit: BoxFit.fill, // Cover the entire background
            ),
          ),
          // Foreground content
          SingleChildScrollView( // This enables scrolling
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      // Back button
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context); // Navigate back to the previous page
                        },
                        icon: Icon(Icons.arrow_back_outlined, color: Colors.black),
                      ),
                      Text(
                        weather.name,
                        style: GoogleFonts.adamina(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(
                    '${weather.main.temp}°C',
                    style: GoogleFonts.aleo(
                      textStyle: TextStyle(fontSize: 60, color: Colors.black), // Set text color to contrast with the background
                    ),
                  ),
                  Text(
                    weather.weather.first.description,
                    style: TextStyle(fontSize: 20, color: Colors.white), // Set text color to contrast with the background
                  ),
                  SizedBox(height: 445,),  // Reduce the size for better control
                  Container(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Wind:\n ${weather.wind.speed} m/s',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Humidity:\n ${weather.main.humidity}%',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Pressure:\n ${weather.main.pressure} hPa',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.transparent.withAlpha(70), // Semi-transparent background
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
