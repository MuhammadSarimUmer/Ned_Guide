import 'package:flutter/material.dart';
import 'package:ned_guide/provider/applicationprovider.dart';
import 'package:ned_guide/pages/departmentdetailpage.dart';
import 'package:ned_guide/pages/homescreenpage.dart';
import 'package:ned_guide/pages/loginpage.dart';
import 'package:ned_guide/dummy_data/neddeparment_dummydata.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApplicationProvider(),

      child: MaterialApp(
        title: 'NED Guide',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          primaryColor: Color(0xFF8E4EC6),
          fontFamily: 'Arimo',

          textTheme: TextTheme(
            headlineSmall: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
            bodySmall: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF8E4EC6),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              minimumSize: Size(double.infinity, 50),
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.grey[300]!),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              minimumSize: Size(double.infinity, 50),
              foregroundColor: Colors.black87,
            ),
          ),
        ),
        home: LoginPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
