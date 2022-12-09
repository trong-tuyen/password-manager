import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'user.dart';
import 'user_list.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with WidgetsBindingObserver {
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  //define states
  User _user = User(email: '', password: '');
  final List<User> _users = <User>[];
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

  void _insertUser() {
    if (_user.email!.isEmpty || _user.password!.isEmpty) {
      return;
    }

    _users.add(_user);
    _user = User(email: '', password: '');
    _emailController.text = '';
    _passwordController.text = '';
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
                  controller: _emailController,
                  onChanged: (text) {
                    setState(() {
                      _user.email = text;
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
                      _user.password = text; //if error, value = 0
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
                                this._insertUser();
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
    Color primaryColor = Theme.of(context).primaryColor;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 3),
        child: Center(
            child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Stack(
                        children: const [
                          Icon(
                            CupertinoIcons.shield_fill,
                            color: Colors.blue,
                            size: 130.0,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 30, left: 35),
                            child: Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 65.0,
                            ),
                          )
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.all(10),
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
                                      fontSize: 33,
                                      fontWeight: FontWeight.bold)),
                              Text("MANAGER",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                  )),
                            ],
                          )
                        ],
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(24.0, 8, 24, 8),
                child: Text("Transparent & Secured.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 42,
                        fontWeight: FontWeight.bold)),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(24.0, 8, 24, 8),
                child: Text(
                  "Only you can see you your personal data",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 23, color: Colors.blue
                      // color: Colors.black54
                      ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  "Login with",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Subtitle", fontSize: 24, color: Colors.white
                      // color: Colors.black54
                      ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 140),
                    child: Image.asset(
                      'assets/images/facebook.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30),
                    child: Image.asset(
                      'assets/images/google.jpg',
                      width: 40,
                      height: 40,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(24.0, 8, 24, 8),
                child: Text("Or",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, color: Colors.white70)),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 60,
                width: size.width * 0.9,
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () {
                      
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (BuildContext context) =>
                      //             const Text('data')));
                    },
                    color: primaryColor,
                    child: const Text("Create New Account",
                        style: TextStyle(color: Colors.white, fontSize: 21))),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 60,
                width: size.width * 0.9,
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () {
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (BuildContext context) =>
                      //             const Text('data')));
                    },
                    color: Colors.purple,
                    child: const Text("Sign In",
                        style: TextStyle(color: Colors.white, fontSize: 21))),
              )
            ],
          ),
        )),
      ),
    );
  }
}
