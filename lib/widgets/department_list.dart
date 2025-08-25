import 'package:flutter/material.dart';
import 'package:ned_guide/pages/departmentdetailpage.dart';
import 'package:ned_guide/dummy_data/neddeparment_dummydata.dart';

class DepartmentList extends StatefulWidget {
  const DepartmentList({super.key});

  @override
  State<DepartmentList> createState() => _DepartmentListState();
}

class _DepartmentListState extends State<DepartmentList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: getAllDepartments().length,
        itemBuilder: (context, index) {
          final department = getAllDepartments()[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Departmentdetailpage(department: department),
                ),
              );
            },
            child: Container(
              width: 180,
              margin: EdgeInsets.only(right: 12),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.purple, width: 2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Image.network(
                          department["image"],
                          fit: BoxFit.cover,
                        ),
                      ),

                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.black.withValues(alpha: 0.4),
                      ),

                      Positioned(
                        bottom: 12,
                        left: 8,
                        right: 8,
                        child: Text(
                          department["name"],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<Map<String, dynamic>> getAllDepartments() {
    List<Map<String, dynamic>> allDepartments = [];

    for (int i = 0; i < nedDepartments.length; i++) {
      List departments = nedDepartments[i]["departments"];

      for (int j = 0; j < departments.length; j++) {
        allDepartments.add(departments[j]);
      }
    }

    return allDepartments;
  }
}
