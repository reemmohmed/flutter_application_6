import 'package:flutter/material.dart';
import 'package:flutter_application_6/helpers/SqlHelper.dart';
import 'package:flutter_application_6/pages/home_page.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var sqlHelper = SqlHelper();
  await sqlHelper.init();
  if (sqlHelper.db != null) {
    GetIt.I.registerSingleton(sqlHelper);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nilu App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff0157db),
          foregroundColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSwatch(
          errorColor: Colors.red,
          cardColor: Colors.blue.shade100,
          backgroundColor: Colors.white,
          primarySwatch: getMaterialColor(Color(0xff0157db)),
        ),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }

  MaterialColor getMaterialColor(Color color) {
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;
    final int alpha = color.alpha;

    final Map<int, Color> shades = {
      50: Color.fromARGB(alpha, red, green, blue),
      100: Color.fromARGB(alpha, red, green, blue),
      200: Color.fromARGB(alpha, red, green, blue),
      300: Color.fromARGB(alpha, red, green, blue),
      400: Color.fromARGB(alpha, red, green, blue),
      500: Color.fromARGB(alpha, red, green, blue),
      600: Color.fromARGB(alpha, red, green, blue),
      700: Color.fromARGB(alpha, red, green, blue),
      800: Color.fromARGB(alpha, red, green, blue),
      900: Color.fromARGB(alpha, red, green, blue),
    };

    return MaterialColor(color.value, shades);
  }
}
