import 'package:flutter/material.dart';
import 'package:ned_guide/neddeparment_dummydata.dart';

class Departmentdetailpage extends StatefulWidget {
  final Map<String, dynamic> department;

  const Departmentdetailpage({super.key, required this.department});

  @override
  State<Departmentdetailpage> createState() => _DepartmentdetailpageState();
}

class _DepartmentdetailpageState extends State<Departmentdetailpage> {
  @override
  Widget build(BuildContext context) {
    final department = widget.department;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(department['image']),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 16, left: 16),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      department['name'],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DetailIcons(Icons.star, 'Achievemnts', Colors.yellow),
                        DetailIcons(Icons.build, 'Projects', Colors.grey),
                        DetailIcons(Icons.book, 'Publications', Colors.brown),
                        DetailIcons(
                          Icons.perm_contact_calendar_rounded,
                          'Events',
                          Colors.lightBlue,
                        ),
                        DetailIcons(Icons.people, 'Clubs', Colors.lightGreen),
                      ],
                    ),
                    SizedBox(height: 16),

                    Text(
                      'About Department',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8E4EC6),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      department['description'] ?? 'No description available',
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.4,
                        color: Colors.grey[700],
                      ),
                    ),

                    SizedBox(height: 20),

                    Row(
                      children: [
                        Icon(Icons.email, color: Color(0xFF8E4EC6), size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Contact: ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            department['contactEmail'],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 12),

                    Row(
                      children: [
                        Icon(Icons.school, color: Color(0xFF8E4EC6), size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Programs: ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'UG: ${department['numberOfPrograms']['undergraduate'] ?? 0}, '
                          'PG: ${department['numberOfPrograms']['postgraduate'] ?? 0}, '
                          'PhD: ${department['numberOfPrograms']['phd'] ?? 0}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.science, color: Color(0xFF8E4EC6), size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Research Areas:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: (department['researchAreas'] as List)
                          .map(
                            (area) => Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFF8E4EC6).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                area.toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF8E4EC6),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(height: 16),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.biotech, color: Color(0xFF8E4EC6), size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Lab Facilities:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: (department['labFacilities'] as List)
                          .map(
                            (lab) => Padding(
                              padding: const EdgeInsets.only(
                                bottom: 4.0,
                                left: 28,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    size: 6,
                                    color: Color(0xFF8E4EC6),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      lab.toString(),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(height: 16),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.people, color: Color(0xFF8E4EC6), size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Faculty Members:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: (department['facultyMembers'] as List)
                          .map(
                            (faculty) => Padding(
                              padding: const EdgeInsets.only(
                                bottom: 8.0,
                                left: 28,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    faculty['name'] ?? 'N/A',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF8E4EC6),
                                    ),
                                  ),
                                  Text(
                                    faculty['title'] ?? 'N/A',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  if (faculty['email'] != null)
                                    Text(
                                      faculty['email'],
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.people, color: Color(0xFF8E4EC6), size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Notable Alumni:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: (department['notableAlumni'] as List)
                          .map(
                            (faculty) => Padding(
                              padding: const EdgeInsets.only(
                                bottom: 8.0,
                                left: 28,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    faculty['name'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF8E4EC6),
                                    ),
                                  ),
                                  Text(
                                    faculty['currentPosition'],
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),

                                  Text(
                                    faculty['achievements'],
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    Divider(),
                    Text(
                      'UnderGraduates:-',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(onPressed: () {}, child: Text('TimeTable')),
                    SizedBox(height: 8),
                    ElevatedButton(onPressed: () {}, child: Text('OBE')),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('ROOM/LAB Allocation'),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Academic Calender'),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Exam Schedule'),
                    ),
                    SizedBox(height: 20),
                    Divider(),
                    if (department['numberOfPrograms']['postgraduate'] !=
                        0) ...[
                      Text(
                        'PostGraduates:-',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('TimeTable'),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(onPressed: () {}, child: Text('OBE')),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('ROOM/LAB Allocation'),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Academic Calender'),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Exam Schedule'),
                      ),
                      SizedBox(height: 8),
                    ],
                    Divider(),
                    if (department['numberOfPrograms']['phd'] != 0) ...[
                      Text(
                        'PhD:-',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('TimeTable'),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('ROOM/LAB Allocation'),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Academic Calender'),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Exam Schedule'),
                      ),
                    ],
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget DetailIcons(IconData icon, String text, Color color) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 30, color: color),
            SizedBox(height: 4),
            Text(text, style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
