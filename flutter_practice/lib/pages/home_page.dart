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
class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _categoryController = TextEditingController();
  final _linkController = TextEditingController();

  //define states
  Password _record_Password =
      Password(name: '', password: '', category: '', link: '');
  final List<Password> _record_Passwords = <Password>[];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

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
                        height: 50,
                      )),
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Expanded(
                          child: SizedBox(
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
                        height: 50,
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
        appBar: AppBar(
          title: const Text('Transaction manager'),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _onButtonShowModalSheet();
                  });
                },
                icon: const Icon(Icons.add))
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
            minimum: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                ),
                ButtonTheme(
                    height: 30,
                    child: TextButton(
                      child: const Text('Insert Transaction',
                          style: TextStyle(fontSize: 18)),
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color.fromARGB(255, 225, 94, 138),
                          textStyle: const TextStyle(fontSize: 20)),
                      onPressed: () {
                        //print('Content = $_content, money\'s amount = $_amount');
                        //Display to UI ?

                        _onButtonShowModalSheet();

                        scaffoldMessengerKey.currentState
                            ?.showSnackBar(SnackBar(
                          content:
                              Text('Transaction list : $_record_Passwords'),
                          duration: const Duration(seconds: 3),
                        ));
                      },
                    )),
                PasswordList(passwords: _record_Passwords)
              ],
            ))));
  }
}
