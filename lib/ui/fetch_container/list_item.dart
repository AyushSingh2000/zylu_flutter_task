import 'package:flutter/material.dart';

import 'fetch_container.dart';

class ListItem extends StatelessWidget {
  final Map employee;

  const ListItem({Key? key, required this.employee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FetchContainer(
            text1: employee['employee'],
            text2: employee['department'],
            text3: employee['date_of_joining'],
          ),
        ],
      ),
    );
  }
}
