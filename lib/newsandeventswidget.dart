import 'package:flutter/material.dart';
import 'package:ned_guide/events_list.dart';
import 'package:ned_guide/ned_events.dart';
import 'package:ned_guide/news_data.dart';

class Newsandeventswidget extends StatefulWidget {
  const Newsandeventswidget({super.key});

  @override
  State<Newsandeventswidget> createState() => _NewsandeventswidgetState();
}

class _NewsandeventswidgetState extends State<Newsandeventswidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.infinity,
        color: const Color.fromARGB(20, 110, 110, 110),
        child: EventsList(),
      ),
    );
  }
}
