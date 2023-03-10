import 'package:flutter/material.dart';
import 'package:flutter_practice/constants/color.dart';
import '../models/user.dart';
import 'package:flutter_practice/validators/validators.dart';
import 'package:flutter_practice/pages/home_page.dart';

class Button extends StatefulWidget {
  final String? text;
  final String type;
  const Button(this.text, this.type);

  @override
  State<Button> createState() => _ButtonState(text, type);
}

class _ButtonState extends State<Button> {
  final String? _text;
  final String _type;

  _ButtonState(this._text, this._type);
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  //define states
  User _user = User(email: '', password: '');
  final List<User> _users = <User>[];

  void _insertUser() {
    if (_user.email!.isEmpty || _user.password!.isEmpty) {
      return;
    }
    _users.add(_user);
    print(_user);
    _user = User(email: '', password: '');
    _emailController.text = '';
    _passwordController.text = '';
  }

  void _onButtonShowModalSheet(String type) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  //   obscureText: true,
                  decoration: const InputDecoration(labelText: 'Email'),
                  controller: _emailController,
                  onChanged: (text) {
                    if (Validators.isValidEmail(text)) {
                      setState(() {
                        _user.email = text; //if error, value = 0
                      });
                    }
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                  controller: _passwordController,
                  onChanged: (text) {
                    if (Validators.isValidPassword(text)) {
                      setState(() {
                        _user.password = text; //if error, value = 0
                      });
                    }
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
                            child: Text(
                                type == 'Create New Account' ? 'Save' : 'Login',
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white)),
                            onPressed: () {
                              if (type == 'Create New Account') {
                                setState(() {
                                  this._insertUser();
                                });
                                Navigator.of(context).pop();
                              } else {
                                // bool isLogin = false;
                                // print(_users);
                                // _users.forEach((element) {
                                //   if (element.email == _user.email &&
                                //       element.password == _user.password) {
                                //     isLogin = true;

                                //     Navigator.of(context).push(
                                //       MaterialPageRoute(
                                //           builder: (context) => HomePage()),
                                //     );
                                //     return;
                                //   }
                                // });
                                // if (isLogin == false) {
                                //   _user = User(email: '', password: '');
                                //   _emailController.text = '';
                                //   _passwordController.text = '';
                                //   Navigator.of(context).pop();
                                // }

                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                );
                              }
                            }),
                      )),
                      const Padding(padding: EdgeInsets.only(left: 10)),
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
                              // print('Press cancel');
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
    var size = MediaQuery.of(context).size;
    return Container(
        child: SizedBox(
            height: 50,
            width: size.width * 0.9,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: _type == 'primaryColor'
                          ? ColorConstants.primaryColor
                          : Colors.white,
                      width: 1)),
              child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () {
                    _onButtonShowModalSheet(_text!);
                  },
                  color: _type == 'primaryColor'
                      ? ColorConstants.primaryColor
                      : Colors.transparent,
                  elevation: 0,
                  child: Text(_text!,
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 17))),
            )));
  }
}
