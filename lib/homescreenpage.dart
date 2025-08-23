import 'package:flutter/material.dart';
import 'package:ned_guide/neduniversitycard.dart';
import 'package:ned_guide/department_list.dart';
import 'package:ned_guide/todaysclasses.dart';
import 'package:ned_guide/newsandeventswidget.dart';

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
        title: const Text(
          'Home',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TEST 1: Add back NEDUniversityCard
              const NEDUniversityCard(),
              const SizedBox(height: 20),

              const Text(
                'Departments',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 16),

              // TEST 2: Add back DepartmentList
              const DepartmentList(),

              const SizedBox(height: 26),
              const Text(
                'Todays Classes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              const Todaysclasses(),
              Newsandeventswidget(),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
