// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:cupertino_icons/cupertino_icons.dart';
// import 'package:flutter_practice/pages/home_page.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import '../models/user.dart';
// import '../views/user_list.dart';
// import 'package:flutter_practice/validators/validators.dart';

// class WelcomePage extends StatefulWidget {
//   static const String routeName = '/WelcomePage';

//   @override
//   _WelcomePageState createState() => _WelcomePageState();
// }

// class _WelcomePageState extends State<WelcomePage> with WidgetsBindingObserver {
//   final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   //define states
//   User _user = User(email: '', password: '');
//   final List<User> _users = <User>[];
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     WidgetsBinding.instance.removeObserver(this);
//   }

//   void _insertUser() {
//     if (_user.email!.isEmpty || _user.password!.isEmpty) {
//       return;
//     }

//     _users.add(_user);
//     _user = User(email: '', password: '');
//     _emailController.text = '';
//     _passwordController.text = '';
//   }

//   void _onButtonShowModalSheet(String type) {
//     showModalBottomSheet(
//         context: context,
//         builder: (context) {
//           return Column(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 child: TextField(
//                   obscureText: true,
//                   decoration: const InputDecoration(labelText: 'Email'),
//                   controller: _emailController,
//                   onChanged: (text) {
//                     if (Validators.isValidEmail(text)) {
//                       setState(() {
//                         _user.email = text; //if error, value = 0
//                       });
//                     }
//                   },
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 child: TextField(
//                   obscureText: true,
//                   decoration: const InputDecoration(labelText: 'Password'),
//                   controller: _passwordController,
//                   onChanged: (text) {
//                     if (Validators.isValidPassword(text)) {
//                       setState(() {
//                         _user.password = text; //if error, value = 0
//                       });
//                     }
//                   },
//                 ),
//               ),
//               Container(
//                   padding: const EdgeInsets.all(10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Expanded(
//                           child: SizedBox(
//                         height: 50,
//                         child: ElevatedButton(
//                             style: ButtonStyle(
//                               backgroundColor:
//                                   MaterialStateProperty.resolveWith<Color>(
//                                       (Set<MaterialState> states) {
//                                 if (states.contains(MaterialState.pressed)) {
//                                   return Colors.teal;
//                                 }
//                                 return Colors
//                                     .teal; // Use the component's default.
//                               }),
//                             ),
//                             child: const Text('Save',
//                                 style: TextStyle(
//                                     fontSize: 16, color: Colors.white)),
//                             onPressed: () {
//                               if (type == 'register') {
//                                 setState(() {
//                                   this._insertUser();
//                                 });
//                                 Navigator.of(context).pop();
//                               } else {
//                                 bool isLogin = false;
//                                 _users.forEach((element) {
//                                   if (element.email == _user.email &&
//                                       element.password == _user.password) {
//                                     isLogin = true;
//                                     Navigator.of(context).push(
//                                       MaterialPageRoute(
//                                           builder: (context) => HomePage()),
//                                     );
//                                     return;
//                                   }
//                                 });
//                                 if (isLogin == false) {
//                                   _user = User(email: '', password: '');
//                                   _emailController.text = '';
//                                   _passwordController.text = '';
//                                   Navigator.of(context).pop();
//                                 }
//                               }
//                             }),
//                       )),
//                       const Padding(padding: EdgeInsets.only(left: 10)),
//                       Expanded(
//                           child: SizedBox(
//                         height: 50,
//                         child: ElevatedButton(
//                             style: ButtonStyle(
//                               backgroundColor:
//                                   MaterialStateProperty.resolveWith<Color>(
//                                       (Set<MaterialState> states) {
//                                 if (states.contains(MaterialState.pressed)) {
//                                   return Colors.pinkAccent;
//                                 }
//                                 return Colors
//                                     .pinkAccent; // Use the component's default.
//                               }),
//                             ),
//                             child: const Text('Cancel',
//                                 style: TextStyle(
//                                     fontSize: 16, color: Colors.white)),
//                             onPressed: () {
//                               // print('Press cancel');
//                               Navigator.of(context).pop();
//                             }),
//                       ))
//                     ],
//                   ))
//             ],
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Color primaryColor = Theme.of(context).primaryColor;
//     var size = MediaQuery.of(context).size;

//     return Scaffold(
//         body: SingleChildScrollView(
//       child: AnimatedContainer(
//         duration: const Duration(seconds: 3),
//         child: Center(
//             child: Container(
//           padding: EdgeInsets.symmetric(vertical: 50),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Row(
//                 children: [
//                   Padding(
//                       padding: const EdgeInsets.only(left: 45),
//                       child: Stack(
//                         children: [
//                           Image.asset('assets/images/shield.png',
//                               width: 100, height: 100),
//                           // Container(
//                           //     child: const Icon(
//                           //   CupertinoIcons.shield_fill,
//                           //   color: Colors.blue,
//                           //   size: 130.0,
//                           // )),
//                           // const Padding(
//                           //   padding: EdgeInsets.only(top: 30, left: 35),
//                           //   child: Icon(
//                           //     Icons.done,
//                           //     color: Colors.white,
//                           //     size: 65.0,
//                           //   ),
//                           // )
//                         ],
//                       )),
//                   Padding(
//                       padding: const EdgeInsets.all(20),
//                       child: Row(
//                         children: [
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: const [
//                               Text("PASSWORD",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 30,
//                                       fontWeight: FontWeight.bold)),
//                               Text("MANAGER",
//                                   textAlign: TextAlign.right,
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 24,
//                                   )),
//                             ],
//                           )
//                         ],
//                       )),
//                 ],
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const Padding(
//                 padding: EdgeInsets.fromLTRB(24.0, 8, 24, 8),
//                 child: Text("Transparent & Secured.",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 37,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Poppins')),
//               ),
//               const Padding(
//                 padding: EdgeInsets.fromLTRB(24.0, 8, 24, 8),
//                 child: Text(
//                   "Only you can see you your personal data",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 23, color: Colors.blue
//                       // color: Colors.black54
//                       ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(top: 30),
//                 child: Text(
//                   "Login with",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       fontFamily: "Subtitle", fontSize: 22, color: Colors.white
//                       // color: Colors.black54
//                       ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.only(left: 140),
//                     child: Image.asset(
//                       'assets/images/facebook.png',
//                       width: 45,
//                       height: 45,
//                     ),
//                   ),
//                   Container(
//                     padding: const EdgeInsets.only(left: 25),
//                     child: Image.asset(
//                       'assets/images/gmail.png',
//                       width: 40,
//                       height: 40,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               const Padding(
//                 padding: EdgeInsets.fromLTRB(24.0, 8, 24, 8),
//                 child: Text("Or",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 22, color: Colors.white70)),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               SizedBox(
//                 height: 60,
//                 width: size.width * 0.9,
//                 child: MaterialButton(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(5)),
//                     onPressed: () {
//                       _onButtonShowModalSheet('register');
//                     },
//                     color: primaryColor,
//                     child: const Text("Create New Account",
//                         style: TextStyle(color: Colors.white, fontSize: 21))),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                   height: 60,
//                   width: size.width * 0.9,
//                   child: Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(color: Colors.white, width: 2)),
//                     child: MaterialButton(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(5)),
//                         onPressed: () {
//                           _onButtonShowModalSheet('login');
//                         },
//                         color: const Color.fromARGB(255, 207, 12, 241),
//                         child: const Text("Sign In",
//                             style:
//                                 TextStyle(color: Colors.white, fontSize: 21))),
//                   ))
//             ],
//           ),
//         )),
//       ),
//     ));
//   }
// }
