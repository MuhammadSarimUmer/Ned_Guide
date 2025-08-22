import 'package:flutter/material.dart';
import 'package:ned_guide/department_list.dart';
import 'package:ned_guide/neddeparment_dummydata.dart';
import 'package:ned_guide/news_data.dart';
import 'package:ned_guide/newsandeventswidget.dart';
import 'package:ned_guide/todaysclasses.dart';

class Homescreenpage extends StatefulWidget {
  const Homescreenpage({super.key});

  @override
  State<Homescreenpage> createState() => _HomescreenpageState();
}

class _HomescreenpageState extends State<Homescreenpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Home',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              'Departments',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'Ubuntu',
              ),
            ),
            SizedBox(height: 16),
            DepartmentList(),
            SizedBox(height: 26),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Todays Classes',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Ubuntu',
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Open Schedule',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.grey[400],
                      size: 18,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 26),
            Todaysclasses(),
            SizedBox(height: 26),
            Newsandeventswidget(),
          ],
        ),
      ),
    );
  }
}
