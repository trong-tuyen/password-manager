import 'package:flutter/material.dart';

class TextContent extends StatelessWidget {
  const TextContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 45),
              child: Stack(
                children: [
                  Image.asset('assets/images/shield.png',
                      width: 100, height: 100),
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
              )),
          Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("PASSWORD",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      Text("MANAGER",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          )),
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}
