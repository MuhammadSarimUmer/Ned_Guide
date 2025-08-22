import 'package:flutter/material.dart';

class Todaysclasses extends StatelessWidget {
  const Todaysclasses({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[350]!),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  'Digital Design Lab',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      color: Colors.grey[400],
                      size: 18,
                    ),
                    Text(
                      '10:00 AM - 12:00 PM',
                      style: TextStyle(fontSize: 14, color: Colors.grey[400]),
                    ),
                    SizedBox(width: 18),
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.grey[400],
                      size: 18,
                    ),

                    Text(
                      'Room 10',
                      style: TextStyle(fontSize: 14, color: Colors.grey[400]),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  'Mr Wasiq Noor',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Ubuntu',
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
