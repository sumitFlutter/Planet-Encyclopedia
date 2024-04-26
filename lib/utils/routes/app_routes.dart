import 'package:flutter/material.dart';
import 'package:planets_project/screen/details/view/details_screen.dart';
import 'package:planets_project/screen/home/view/home_screen.dart';
import 'package:planets_project/screen/splesh/view/splesh_screen.dart';

Map<String,WidgetBuilder> appRoutes={
  "/":(context) => SpleshScreen(),
"home":(context) => HomeScreen(),
  "details":(context) => DetailsScreen()
};