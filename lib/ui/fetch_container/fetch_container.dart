// import 'package:flutter/material.dart';
//
// import '../../colors.dart';
//
// class FetchContainer extends StatelessWidget {
//   FetchContainer(
//       {required this.text1, required this.text2, required this.text3, Key? key})
//       : super(key: key);
//
//   String text1;
//   String text2;
//   String text3;
//
//   @override
//   Widget build(BuildContext context) {
//     // Get current date
//     DateTime currentDate = DateTime.now();
//
//     // Parse the text3 (date of joining) to DateTime
//     DateTime dateOfJoining = DateTime.parse(text3);
//
//     // Calculate the difference in years
//     int differenceInYears = currentDate.year - dateOfJoining.year;
//
//     // Adjust if the current month/day is before the joining month/day
//     if (currentDate.month < dateOfJoining.month ||
//         (currentDate.month == dateOfJoining.month &&
//             currentDate.day < dateOfJoining.day)) {
//       differenceInYears--;
//     }
//
//     // Condition to check if the difference is more than 5 years
//     bool moreThanFiveYears = differenceInYears > 5;
//
//     // Set the background color based on the condition
//     Color backgroundColor =
//         moreThanFiveYears ? Colors.green : Pallete.txt2color;
//
//     return Padding(
//       padding: const EdgeInsets.only(
//         left: 20.0,
//       ),
//       child: Row(
//         children: <Widget>[
//           Container(
//             width: MediaQuery.sizeOf(context).width / 1.12,
//             height: 102,
//             decoration: BoxDecoration(
//               color: backgroundColor,
//               borderRadius: const BorderRadius.all(
//                 Radius.circular(12),
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.3),
//                   blurRadius: 5,
//                   offset: const Offset(-4, 2),
//                   spreadRadius: 3,
//                 )
//               ],
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   child: Row(
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           SizedBox(
//                             height: 12,
//                           ),
//                           Container(
//                             padding: EdgeInsets.only(
//                               left: 10,
//                             ),
//                             alignment: Alignment.bottomLeft,
//                             child: Text(
//                               'NAME: $text1'.toUpperCase(),
//                               style: TextStyle(
//                                 color: Colors.black.withOpacity(0.7),
//                                 fontSize: 15,
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.w800,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 8,
//                           ),
//                           Container(
//                             padding: EdgeInsets.only(
//                               left: 10,
//                             ),
//                             alignment: Alignment.bottomLeft,
//                             child: Text(
//                               'Department: $text2'.toUpperCase(),
//                               style: TextStyle(
//                                 color: Colors.black.withOpacity(0.7),
//                                 fontSize: 15,
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.w800,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 8,
//                           ),
//                           Container(
//                             padding: EdgeInsets.only(
//                               left: 10,
//                             ),
//                             alignment: Alignment.bottomLeft,
//                             child: Text(
//                               'DOJ: $text3'.toUpperCase(),
//                               style: TextStyle(
//                                 color: Colors.black.withOpacity(0.7),
//                                 fontSize: 15,
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.w800,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

import '../../colors.dart';

class FetchContainer extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final String text4;

  const FetchContainer({
    Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
  }) : super(key: key);

  bool isMoreThanFiveYears(DateTime dateOfJoining) {
    DateTime currentDate = DateTime.now();

    // Calculate the difference in years
    int differenceInYears = currentDate.year - dateOfJoining.year;

    // Adjust if the current month/day is before the joining month/day
    if (currentDate.month < dateOfJoining.month ||
        (currentDate.month == dateOfJoining.month &&
            currentDate.day < dateOfJoining.day)) {
      differenceInYears--;
    }

    return differenceInYears > 5;
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateOfJoining = DateTime.parse(text3);

    bool showActingText =
        isMoreThanFiveYears(dateOfJoining) && text4 == "Active";

    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
      ),
      child: Row(
        children: <Widget>[
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.12,
                height: 102,
                decoration: BoxDecoration(
                  color: Pallete.txt2color,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      offset: const Offset(-4, 2),
                      spreadRadius: 3,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                  ),
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'NAME: $text1'.toUpperCase(),
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                  ),
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'Department: $text2'.toUpperCase(),
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                  ),
                                  alignment: Alignment.bottomLeft,
                                  child: Row(
                                    children: [
                                      Text(
                                        'DOJ: $text3'.toUpperCase(),
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.7),
                                          fontSize: 15,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 40,
                                      ),
                                      Container(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          'Status: $text4'.toUpperCase(),
                                          style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            fontSize: 15,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (showActingText)
                Positioned(
                  top: 0,
                  left: 8,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Container(
                      width: 102,
                      color: Colors.green,
                      child: Center(
                        child: Text(
                          'ACTIVE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
