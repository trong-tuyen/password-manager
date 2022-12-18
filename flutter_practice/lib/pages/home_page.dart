// import 'dart:ffi';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import '../models/password.dart';
import '../views/password_list.dart';

//You can define your own Widget
class HomePage extends StatefulWidget {
  static const String routeName = '/HomePage';

  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return _HomePageState();
  }
}

//This is a "very basic" statefulwidget
class _HomePageState extends State<HomePage> {
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _categoryController = TextEditingController();
  final _linkController = TextEditingController();

  //define states
  Password _record_Password =
      Password(name: '', password: '', category: '', link: '');
  final List<Password> _record_Passwords = <Password>[];

  void _insertTransaction() {
    if (_record_Password.name!.isEmpty ||
        _record_Password.password!.isEmpty ||
        _record_Password.category!.isEmpty ||
        _record_Password.link!.isEmpty) {
      return;
    }

    _record_Passwords.add(_record_Password);
    _record_Password = Password(name: '', password: '', category: '', link: '');
    _nameController.text = '';
    _passwordController.text = '';
    _categoryController.text = '';
    _linkController.text = '';
  }

  void _onButtonShowModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  decoration: const InputDecoration(labelText: 'Content'),
                  controller: _nameController,
                  onChanged: (text) {
                    setState(() {
                      _record_Password.name = text;
                    });
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  decoration: const InputDecoration(labelText: 'Amount(money)'),
                  controller: _passwordController,
                  onChanged: (text) {
                    setState(() {
                      _record_Password.password = text;
                    });
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  decoration: const InputDecoration(labelText: 'Amount(money)'),
                  controller: _categoryController,
                  onChanged: (text) {
                    setState(() {
                      _record_Password.category = text;
                    });
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  decoration: const InputDecoration(labelText: 'Amount(money)'),
                  controller: _linkController,
                  onChanged: (text) {
                    setState(() {
                      _record_Password.link = text;
                    });
                  },
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                          child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.teal;
                                }
                                return Colors
                                    .teal; // Use the component's default.
                              }),
                            ),
                            child: Text('Save',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                            onPressed: () {
                              print('press Save');
                              setState(() {
                                this._insertTransaction();
                              });
                              Navigator.of(context).pop();
                            }),
                      )),
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Expanded(
                          child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.pinkAccent;
                                }
                                return Colors
                                    .pinkAccent; // Use the component's default.
                              }),
                            ),
                            child: const Text('Cancel',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                            onPressed: () {
                              print('Press cancel');
                              Navigator.of(context).pop();
                            }),
                      ))
                    ],
                  ))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: const [
              Text('All',
                  style: TextStyle(
                      color: Color(0xff6F6F6F),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins')),
              SizedBox(
                width: 20,
              ),
              Text('Recent',
                  style: TextStyle(
                      color: Color(0xff6F6F6F),
                      fontSize: 16,
                      fontFamily: 'Poppins'))
            ],
          ),
          actions: [
            FloatingActionButton(
              tooltip: 'Add transaction',
              child: Image.asset(
                'assets/images/filter.png',
                width: 40,
                height: 40,
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              onPressed: () {
                _onButtonShowModalSheet();
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add transaction',
          child: const Icon(Icons.add),
          onPressed: () {
            _onButtonShowModalSheet();
          },
        ),
        key: scaffoldMessengerKey,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // const Padding(
              //   padding: EdgeInsets.symmetric(vertical: 10),
              // ),
              PasswordList(passwords: _record_Passwords)
            ],
          )),
        ));
  }
}
