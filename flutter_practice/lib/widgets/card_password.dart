import 'package:flutter/material.dart';

class RecordPassword extends StatelessWidget {
  const RecordPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          SizedBox(
            width: 34.0,
          ),
          Expanded(
            child: Text(
              'Twiter',
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Poppins",
                color: Color(0xFF0C122A),
              ),
            ),
          ),
          Expanded(
            child: Text(
              'tuyen@gmail.com',
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Poppins",
                color: Color(0xFF0C122A),
              ),
            ),
          ),
        ],
      ),
    );
  }
}