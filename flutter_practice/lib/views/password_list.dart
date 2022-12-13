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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: (index) % 2 == 0 ? Colors.green : Colors.teal,
              elevation: 10,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 10)),
                      Text(
                        passwords![index].name ?? 'tuyen',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      const Text(
                        'Date:',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 10)),
                    ],
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                  style: BorderStyle.solid),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: Text('${passwords![index].password}',
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white))),
                      const Padding(padding: EdgeInsets.only(right: 10)),
                    ],
                  ))
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
