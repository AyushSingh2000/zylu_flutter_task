import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../utils/toast_message.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  bool loading = false;
  final employeeController = TextEditingController();
  final departmentController = TextEditingController();
  final dateOfJoiningController = TextEditingController();
  final isActive = TextEditingController();
  final databaseRef = FirebaseDatabase.instance.ref().child('Employee');

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            TextField(
              controller: employeeController,
              keyboardType: TextInputType.text,
              cursorColor: Pallete.txt1color,
              autofocus: true,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'Employee Name',
                labelStyle: const TextStyle(
                  color: Pallete.txt1color,
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
                hintText: 'Enter Employee Name',
                hintStyle: const TextStyle(
                  color: Pallete.txt3color,
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: departmentController,
              keyboardType: TextInputType.text,
              cursorColor: Pallete.txt1color,
              autofocus: true,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'Department Name',
                labelStyle: const TextStyle(
                  color: Pallete.txt1color,
                  fontSize: 17,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
                hintText: 'Enter Department',
                hintStyle: const TextStyle(
                  color: Pallete.txt3color,
                  fontSize: 17,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: dateOfJoiningController,
              keyboardType: TextInputType.datetime,
              cursorColor: Pallete.txt1color,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'Date of Joining',
                labelStyle: const TextStyle(
                  color: Pallete.txt1color,
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
                hintText: 'Date Format (YYYY-MM-DD)', // Hint text
                hintStyle: const TextStyle(
                  color: Pallete.txt3color,
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: isActive,
              keyboardType: TextInputType.text,
              cursorColor: Pallete.txt1color,
              autofocus: true,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'Active or Inactive',
                labelStyle: const TextStyle(
                  color: Pallete.txt1color,
                  fontSize: 17,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
                hintText: 'Enter active or inactive',
                hintStyle: const TextStyle(
                  color: Pallete.txt3color,
                  fontSize: 17,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // RoundButton(
            //   title: 'Submit',
            //   onTap: () {
            //     Map<String, String> employee = {
            //       'employee': employeeController.text,
            //       'department': departmentController.text,
            //       // 'salary': userSalaryController.text
            //     };
            //
            //     databaseRef.push().set(employee);
            //     Navigator.pop(context, 'ok');
            //   },
            // ),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Pallete.mainbgcolor,
                ),
                onPressed: () {
                  Map<String, String> employee = {
                    'employee': employeeController.text,
                    'department': departmentController.text,
                    'date_of_joining': dateOfJoiningController.text,
                    'active_status': isActive.text,
                    // 'salary': userSalaryController.text
                  };

                  databaseRef.push().set(employee).then((value) {
                    Utils().toastMessage('Employee added');
                    setState(() {
                      loading = false;
                    });
                  }).onError((error, stackTrace) {
                    Utils().toastMessage(error.toString());
                    setState(() {
                      loading = false;
                    });
                  });
                  Navigator.pop(context, 'ok');
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Pallete.txt2color,
                    fontSize: 17,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
