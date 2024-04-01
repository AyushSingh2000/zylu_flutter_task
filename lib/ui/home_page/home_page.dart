import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:zylu_flutter_task/ui/add_employee/add_employee.dart';

import '../../colors.dart';
import '../fetch_container/list_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Query dbRef = FirebaseDatabase.instance.ref().child('Employee');

  // Widget listItem({required Map employee}) {
  //   return SizedBox(
  //     height: 110,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         FetchContainer(
  //           text1: employee['employee'],
  //           text2: employee['department'],
  //           text3: employee['date_of_joining'],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Text(
                  'Employee Status'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 30,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 80),
                height: MediaQuery.of(context).size.height,
                child: FirebaseAnimatedList(
                  query: dbRef,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    Map employee = snapshot.value as Map;
                    employee['key'] = snapshot.key;

                    return ListItem(employee: employee);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Colors.white,
            title: Text(
              'Enter Employee Details',
              style: TextStyle(
                color: Pallete.txt1color,
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            content: AddEmployee(),
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        backgroundColor: Pallete.mainbgcolor,
        label: const Text(
          'Enter Employee Details',
          style: TextStyle(
            color: Pallete.txt2color,
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        icon: const Icon(
          Icons.developer_board_rounded,
          color: Pallete.txt2color,
        ),
      ),
    );
  }
}
