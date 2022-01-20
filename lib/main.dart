import 'package:flutter/material.dart';
import 'package:city_influencers_app/pages/login.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
void main() {
  runApp(const CityInfluencersApp());
}

class CityInfluencersApp extends StatelessWidget {
  const CityInfluencersApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  ResponsiveSizer(
   builder: (context, orientation, screenType) {
     return const Login();
   },
    ));
  }
}