import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 200, left: 100),
        child: Stack(
          children: [
            Image.asset('assets/images/shield.png', width: 100, height: 100),
            // Container(
            //     child: const Icon(
            //   CupertinoIcons.shield_fill,
            //   color: Colors.blue,
            //   size: 130.0,
            // )),
            // const Padding(
            //   padding: EdgeInsets.only(top: 30, left: 35),
            //   child: Icon(
            //     Icons.done,
            //     color: Colors.white,
            //     size: 65.0,
            //   ),
            // )
          ],
        ));
  }
}
