import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:planets_project/screen/home/provider/planets_details_provider.dart';
import 'package:planets_project/screen/home/provider/theme_provider.dart';
import 'package:planets_project/utils/routes/app_routes.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    MultiProvider(
      providers:[
        ChangeNotifierProvider.value(value: PlanetsDetailsProvider()),
        ChangeNotifierProvider.value(value: ThemeProvider())
      ],
      child:Consumer<ThemeProvider>(
        builder: (context, value,child) {
          value.getTheme();
          value.theme = value.pTheme;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: appRoutes,
          );
        }
    )
    )
  );
}