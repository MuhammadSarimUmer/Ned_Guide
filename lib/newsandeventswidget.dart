import 'package:flutter/material.dart';
import 'package:ned_guide/news_data.dart';
import 'package:ned_guide/ned_events.dart';

class NewsAndEventsList extends StatefulWidget {
  const NewsAndEventsList({super.key});

  @override
  State<NewsAndEventsList> createState() => _NewsAndEventsListState();
}

class _NewsAndEventsListState extends State<NewsAndEventsList> {
  int selectedTab = 0; // 0 for News, 1 for Events

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tab Bar
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              // News Tab
              GestureDetector(
                onTap: () => setState(() => selectedTab = 0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: selectedTab == 0 ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: selectedTab == 0
                          ? Colors.grey[300]!
                          : Colors.transparent,
                    ),
                    boxShadow: selectedTab == 0
                        ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ]
                        : null,
                  ),
                  child: Text(
                    'News',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: selectedTab == 0
                          ? FontWeight.w600
                          : FontWeight.w400,
                      color: selectedTab == 0 ? Colors.black : Colors.grey[600],
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),

              // Events Tab
              GestureDetector(
                onTap: () => setState(() => selectedTab = 1),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: selectedTab == 1 ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: selectedTab == 1
                          ? Colors.grey[300]!
                          : Colors.transparent,
                    ),
                    boxShadow: selectedTab == 1
                        ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ]
                        : null,
                  ),
                  child: Text(
                    'Events',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: selectedTab == 1
                          ? FontWeight.w600
                          : FontWeight.w400,
                      color: selectedTab == 1 ? Colors.black : Colors.grey[600],
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Content based on selected tab
        selectedTab == 0 ? _buildNewsList() : _buildEventsList(),
      ],
    );
  }

  Widget _buildNewsList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: nedNews.length,
      itemBuilder: (context, index) {
        final news = nedNews[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey[200]!),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                news["title"] ?? "No Title",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Ubuntu',
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                news["description"] ?? "No Description",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  fontFamily: 'Ubuntu',
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 14, color: Colors.grey[500]),
                  const SizedBox(width: 6),
                  Text(
                    news["date"] ?? "No Date",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEventsList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: nedEvents.length,
      itemBuilder: (context, index) {
        final event = nedEvents[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey[200]!),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              // Event Info
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event["title"] ?? "No Title",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Ubuntu',
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      event["venue"] ?? "No Venue",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                        fontFamily: 'Ubuntu',
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 14,
                          color: Colors.grey[500],
                        ),
                        const SizedBox(width: 6),
                        Text(
                          event["date"] ?? "No Date",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                            fontFamily: 'Ubuntu',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),

              // Event Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child:
                      event["image"] != null &&
                          event["image"].toString().isNotEmpty
                      ? Image.network(
                          event["image"],
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              color: Colors.grey[200],
                              child: Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  value:
                                      loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              child: Icon(
                                Icons.image_not_supported,
                                color: Colors.grey[500],
                                size: 24,
                              ),
                            );
                          },
                        )
                      : Container(
                          color: Colors.grey[300],
                          child: Icon(
                            Icons.image,
                            color: Colors.grey[500],
                            size: 24,
                          ),
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Main widget that you import in your home screen
class Newsandeventswidget extends StatelessWidget {
  const Newsandeventswidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
      ),
      child: const NewsAndEventsList(),
    );
  }
}
