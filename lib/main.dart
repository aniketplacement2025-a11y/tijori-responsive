// main.dart
import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/services/functions/storage_area_of_access_token.dart';
import 'package:vkaps_it_solution_project_tijori/utils/constants.dart';
import 'widgets/presentation/SplashScreen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageAreaOfAccessToken.instance.init(); // Use .instance
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tijori+',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: Constants.primaryfont, // Use your font
        visualDensity: VisualDensity.adaptivePlatformDensity,
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