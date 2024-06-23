import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test4/api_tutorial/screens/postapi_screen.dart';
import 'package:test4/pets_api_with_provider/pets_provider.dart';
import 'package:test4/pets_api_with_provider/pets_screen.dart';
import 'package:test4/provider_tutorial/provider/auth_provider.dart';
import 'package:test4/provider_tutorial/provider/count_provider.dart';
import 'package:test4/provider_tutorial/provider/dark_theme_provider.dart';
import 'package:test4/provider_tutorial/provider/example_opacity_provider.dart';
import 'package:test4/provider_tutorial/provider/favourite_provider.dart';
import 'package:test4/provider_tutorial/screens/login_screen.dart';
import 'package:test4/random_dog_img/screens/dog_home_page.dart';
import 'package:test4/random_dog_img/dog_provider.dart';

import 'api_tutorial/screens/photosapi_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleOpacityProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => DogProvider()),
        ChangeNotifierProvider(create: (_) => PetsProvider()),
      ],
      child: Builder(
        builder: (BuildContext context){
          final themeChanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Test',
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.deepPurple,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.red,
            ),
            home: const DogHomePage(),
          );
        }
      ),
    );
  }
}
