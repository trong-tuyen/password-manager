import 'package:flutter/material.dart';

class IconLogin extends StatelessWidget {
  const IconLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 140),
            child: Image.asset(
              'assets/images/facebook.png',
              width: 45,
              height: 45,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 25),
            child: Image.asset(
              'assets/images/gmail.png',
              width: 40,
              height: 40,
            ),
          ),
        ],
      ),
    );
  }
}
