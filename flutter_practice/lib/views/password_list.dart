import 'package:flutter/material.dart';

import '../models/password.dart';

class PasswordList extends StatelessWidget {
  final List<Password>? passwords;

  const PasswordList({this.passwords});

  ListView _buildListView() {
    return ListView.builder(
        itemCount: passwords?.length,
        itemBuilder: (context, index) {
          return Card(
              child: Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                left: 37,
              )),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/twitter.png',
                        ),
                        Padding(padding: EdgeInsets.only(left: 20)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Twitter',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  color: Color(0xff3E3E3E)),
                            ),
                            Padding(padding: EdgeInsets.only(top: 2)),
                            Row(
                              children: [
                                Text(
                                  passwords![index].name ?? 'Media',
                                  style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      color: Color(0xff898989)),
                                ),
                                Padding(padding: EdgeInsets.only(left: 30)),
                                Text(
                                  '******',
                                  style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      color: Color(0xff898989)),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    // const Padding(padding: EdgeInsets.only(top: 20)),

                    const Padding(padding: EdgeInsets.only(top: 10)),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     MaterialButton(
                    //         shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(20)),
                    //         onPressed: () {
                    //           // _onButtonShowModalSheet('login');
                    //         },
                    //         color: Colors.purple,
                    //         child: const Text("Open app",
                    //             style: TextStyle(
                    //                 fontFamily: 'Poppins',
                    //                 color: Colors.white,
                    //                 fontSize: 12))),
                    //     Padding(padding: EdgeInsets.only(right: 10)),
                    //     MaterialButton(
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(20),
                    //           side: BorderSide(color: Colors.purple, width: 1),
                    //         ),
                    //         onPressed: () {},
                    //         child: const Text("Open web",
                    //             style: TextStyle(
                    //                 fontFamily: 'Poppins',
                    //                 color: Color(0xff9271F5),
                    //                 fontSize: 12))),
                    //   ],
                    // )
                  ],
                ),
              )
            ],
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    //Now how to make this "Scrollable", let use ListView:
    //1.ListView(children: <Widget>[]) => this loads all children at the same time
    //2.ListView(itemBuilder: ...) => this loads only visible items
    return SizedBox(height: 500, child: _buildListView());
  }
}
