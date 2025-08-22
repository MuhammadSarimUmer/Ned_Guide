import 'package:flutter/material.dart';
import 'package:ned_guide/ned_events.dart';

class EventsList extends StatefulWidget {
  const EventsList({super.key});

  @override
  State<EventsList> createState() => _EventsListState();
}

class _EventsListState extends State<EventsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: nedEvents.length,
      itemBuilder: (context, index) {
        final events = nedEvents[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.grey[300]!),
            ),
            width: double.infinity,
            height: 160,
            child: Card(
              elevation: 4,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                events["title"],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Ubuntu',
                                ),
                                maxLines: 2,
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: 14,
                                    color: Colors.grey[500],
                                  ),
                                  SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      events["venue"],

                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey[600],
                                        fontFamily: 'Ubuntu',
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                size: 14,
                                color: Colors.grey[500],
                              ),
                              SizedBox(width: 4),
                              Text(
                                events["date"],
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey[600],
                                  fontFamily: 'Ubuntu',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            events["image"],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
