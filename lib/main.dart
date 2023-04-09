// ignore_for_file: library_private_types_in_public_api, prefer_typing_uninitialized_variables

import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tunesta/models/login_models.dart';
import 'package:tunesta/screens/account_page.dart';
import 'package:tunesta/screens/home_screen.dart';
import 'package:tunesta/screens/search_page.dart';
import 'package:tunesta/screens/your_library.dart';
import 'package:tunesta/utils/utilities.dart';

void main() {
  runApp(const Tunesta());
}

class Tunesta extends StatelessWidget {
  const Tunesta({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: const LogInPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentindex = 0;
  final tabs = [
    const HomeScreen(),
    const SearchPageVal(),
    const YourLibrary(),
    const AccountPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.colorShade0,
      body: tabs[_currentindex],
      //floatingActionButton: ,
      bottomNavigationBar: CurvedNavigationBar(
        color: CustomColors.colorShade2,
        index: _currentindex,
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: CustomColors.colorShade0,
        items: const [
          CurvedNavigationBarItem(
            child: Icon(Icons.home),
            //label: 'Home',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.search),
            // label: 'Search',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.library_music),
            // label: 'Chat',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.perm_identity),
            // label: 'Personal',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
    );
  }
}

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [CustomColors.colorShade2, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Gap(200),
            const Text(
              "Let Music flow in\n your heart and\n enrich your soul",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
            const Gap(50),
            TestWidget(
              buttonColor: Colors.blue.shade900,
              textColor: Colors.white,
              titleIcon: Icons.facebook,
              titleText: "Sign Up from Facebook",
            ),
            const Gap(20),
            const TestWidget(
              buttonColor: Colors.white,
              textColor: Colors.black,
              titleIcon: Icons.apple,
              titleText: "Continue with Apple",
            ),
            const Gap(20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpPage()));
              },
              child: const TestWidget(
                buttonColor: CustomColors.colorShade3,
                textColor: Colors.white,
                titleIcon: Icons.email,
                titleText: "Sign Up From E-Mail",
              ),
            ),
            const Gap(25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already a Member? "),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInPage()));
                    },
                    child: const Text(
                      "Sign In",
                      style:
                          TextStyle(color: Color.fromARGB(255, 216, 97, 255)),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [CustomColors.colorShade2, Colors.black],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Gap(200),
                  const Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(20),
                  const Text(
                    "Enjoy Music for every kind of taste",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: CustomColors.colorShade4,
                    ),
                  ),
                  const Gap(60),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: CustomColors.colorShade4,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "E-Mail",
                        suffixIconColor: Colors.white,
                        //suffixIcon: Icon(Icons.cancel_outlined),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      keyboardAppearance: Brightness.dark,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Gap(25),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: CustomColors.colorShade4,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: TextField(
                      obscureText: _showPassword ? false : true,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              if (_showPassword == true) {
                                setState(() {
                                  _showPassword = false;
                                });
                              } else {
                                setState(() {
                                  _showPassword = true;
                                });
                              }
                            },
                            icon: _showPassword
                                ? Icon(
                                    Icons.password,
                                    color: Colors.grey[600],
                                  )
                                : Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.grey[600],
                                  )),
                        border: InputBorder.none,
                        hintText: "Password",
                        suffixIconColor: Colors.white,
                        //suffixIcon: Icon(Icons.cancel_outlined),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      keyboardAppearance: Brightness.dark,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Gap(40),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: CustomColors.colorShade1),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [CustomColors.colorShade2, Colors.black],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: Column(
                children: [
                  const Gap(250),
                  const Text(
                    "Sign Up from E-Mail",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(20),
                  const Text(
                    "Enjoy Music for every kind of taste",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: CustomColors.colorShade4,
                    ),
                  ),
                  const Gap(60),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: CustomColors.colorShade4,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Full Name",
                        suffixIconColor: Colors.white,
                        //suffixIcon: Icon(Icons.cancel_outlined),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      keyboardAppearance: Brightness.dark,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Gap(25),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: CustomColors.colorShade4,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "E-Mail",
                        suffixIconColor: Colors.white,
                        //suffixIcon: Icon(Icons.cancel_outlined),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      keyboardAppearance: Brightness.dark,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Gap(25),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: CustomColors.colorShade4,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: TextField(
                      obscureText: _showPassword ? false : true,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              if (_showPassword == true) {
                                setState(() {
                                  _showPassword = false;
                                });
                              } else {
                                setState(() {
                                  _showPassword = true;
                                });
                              }
                            },
                            icon: _showPassword
                                ? Icon(
                                    Icons.password,
                                    color: Colors.grey[600],
                                  )
                                : Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.grey[600],
                                  )),
                        border: InputBorder.none,
                        hintText: "Password",
                        suffixIconColor: Colors.white,
                        //suffixIcon: Icon(Icons.cancel_outlined),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      keyboardAppearance: Brightness.dark,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Gap(40),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: CustomColors.colorShade1),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const Gap(300),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
