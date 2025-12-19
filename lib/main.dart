// main.dart
import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/utils/constants.dart';
import 'widgets/presentation/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tijori+',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: Constants.primaryfont, // Use your font
      ),
      // Use builder to wrap child with layout
      builder: (context, child) {
        // Update constants with context
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Constants.updateFromContext(context);
        });

        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: MediaQuery.of(context).textScaleFactor.clamp(0.8, 1.2),
          ),
          child: child!,
        );
      },
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}