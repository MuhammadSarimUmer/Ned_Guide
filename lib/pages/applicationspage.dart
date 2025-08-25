import 'package:flutter/material.dart';
import 'package:ned_guide/provider/applicationprovider.dart';
import 'package:provider/provider.dart';

class Applicationspage extends StatefulWidget {
  const Applicationspage({super.key});

  @override
  State<Applicationspage> createState() => _ApplicationspageState();
}

class _ApplicationspageState extends State<Applicationspage> {
  @override
  Widget build(BuildContext context) {
    final applications = Provider.of<ApplicationProvider>(context).applications;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text(
          'Applications',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
      ),
      body: applications.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.assignment, size: 80, color: Colors.grey[400]),
                  SizedBox(height: 16),
                  Text(
                    'No Applications Yet',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: applications.length,
              itemBuilder: (context, index) {
                final application = applications[index];
                return Card(
                  margin: EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(12),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: Image.network(
                          application['image'] ?? '',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              child: Icon(
                                Icons.school,
                                color: Colors.grey[600],
                                size: 30,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    title: Text(
                      application['name'] ?? 'Unknown Department',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4),
                        Text(
                          'Pending',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.orange[700],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Applied: 27 Aug 2025',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        _showDeleteConfirmation(context, application);
                      },
                      icon: Icon(Icons.delete, color: Colors.red[400]),
                    ),
                  ),
                );
              },
            ),
    );
  }

  void _showDeleteConfirmation(
    BuildContext context,
    Map<String, dynamic> application,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Application'),
          content: Text(
            'Are you sure you want to delete this application for ${application['name']}?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Provider.of<ApplicationProvider>(
                  context,
                  listen: false,
                ).removeApplication(application);
                Navigator.of(context).pop();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Application deleted successfully'),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
