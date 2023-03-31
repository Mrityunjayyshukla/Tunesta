// ignore_for_file: library_private_types_in_public_api, prefer_typing_uninitialized_variables

import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tunesta/models/custom_widgets.dart';
import 'package:tunesta/models/loginModels.dart';
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
      backgroundColor: CustomColors.colorShade2,
      body: tabs[_currentindex],
      floatingActionButton: const PlayerButton(),
      bottomNavigationBar: CurvedNavigationBar(
        color: CustomColors.colorShade1,
        index: _currentindex,
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.black,
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
      //backgroundColor: CustomColors.colorShade1,
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
                buttonColor: Color.fromARGB(255, 221, 77, 77),
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
                      style: TextStyle(color: CustomColors.colorShade4),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TabBarViewer extends StatefulWidget {
  const TabBarViewer({super.key});

  @override
  State<TabBarViewer> createState() => _TabBarViewerState();
}

class _TabBarViewerState extends State<TabBarViewer> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Column(children: const [
          TabBar(
            indicatorColor: Color(0xFF480975),
            tabs: [
              Tab(text: "Lyrics"),
              Tab(text: "Queue"),
            ],
          ),
          SizedBox(
              height: 400,
              child: TabBarView(children: [
                Center(child: Text("Song Lyrics will appear here")),
                NowPlayingQueue(),
              ]))
        ]));
  }
}

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
              physics: const NeverScrollableScrollPhysics(),
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
                  const TextField(
                    decoration: InputDecoration(
                      hintText: "E-Mail",
                      suffixIconColor: Colors.white,
                      //suffixIcon: Icon(Icons.cancel_outlined),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    keyboardAppearance: Brightness.dark,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const Gap(25),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      suffixIconColor: Colors.white,
                      //suffixIcon: Icon(Icons.cancel_outlined),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    keyboardAppearance: Brightness.dark,
                    style: TextStyle(fontWeight: FontWeight.w500),
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
            physics: const NeverScrollableScrollPhysics(),
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
                  const TextField(
                    decoration: InputDecoration(
                      hintText: "Full Name",
                      suffixIconColor: Colors.white,
                      //suffixIcon: Icon(Icons.cancel_outlined),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    keyboardAppearance: Brightness.dark,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const Gap(25),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: "E-Mail",
                      suffixIconColor: Colors.white,
                      //suffixIcon: Icon(Icons.cancel_outlined),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    keyboardAppearance: Brightness.dark,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const Gap(25),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      suffixIconColor: Colors.white,
                      //suffixIcon: Icon(Icons.cancel_outlined),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    keyboardAppearance: Brightness.dark,
                    style: TextStyle(fontWeight: FontWeight.w500),
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

class PlayerButton extends StatefulWidget {
  const PlayerButton({super.key});

  @override
  State<PlayerButton> createState() => PlayerButtonState();
}

class PlayerButtonState extends State<PlayerButton> {
  @override
  Widget build(BuildContext context) {
    bool isplaying = false;
    return GestureDetector(
      onLongPress: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AccountPage()));
      },
      onTap: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: CustomColors.colorShade2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            builder: (context) => DraggableScrollableSheet(
                expand: false,
                initialChildSize: 0.6,
                minChildSize: 0.32,
                maxChildSize: 0.85,
                builder: (context, scrollController) => SingleChildScrollView(
                      controller: scrollController,
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            const Icon(Icons.expand_less_rounded),
                            const Gap(32),
                            CircularPercentIndicator(
                              radius: 100,
                              lineWidth: 10,
                              percent: 0.7,
                              progressColor: Colors.black,
                              backgroundColor: CustomColors.colorShade3,
                              circularStrokeCap: CircularStrokeCap.round,
                              center: ClipRRect(
                                borderRadius: BorderRadius.circular(80),
                                child: const Image(
                                  image: AssetImage(CustomImages.imageDefault),
                                  height: 160,
                                  width: 160,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Gap(25),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "Music Name",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Gap(10),
                                      Text(
                                        "Artist Name",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Icon(
                                    Icons.more_horiz,
                                  ),
                                ],
                              ),
                            ),
                            const Gap(32),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.shuffle),
                                const Gap(40),
                                const PlayerButtonIcons(
                                  icon: Icons.skip_previous_outlined,
                                ),
                                const Gap(25),
                                GestureDetector(
                                  onTap: () {
                                    if (isplaying == true) {
                                      setState(() {
                                        isplaying == false;
                                      });
                                    } else {
                                      isplaying = true;
                                    }
                                  },
                                  child: PlayerButtonIcons(
                                    icon: isplaying
                                        ? Icons.pause_outlined
                                        : Icons.play_arrow_outlined,
                                  ),
                                ),
                                const Gap(25),
                                const PlayerButtonIcons(
                                  icon: Icons.skip_next_outlined,
                                ),
                                const Gap(40),
                                const Icon(Icons.repeat),
                              ],
                            ),
                            const Gap(25),
                            const TabBarViewer(),
                          ],
                        ),
                      ),
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xFF230438),
            borderRadius: BorderRadius.circular(40)),
        padding: const EdgeInsets.all(18),
        child: const Icon(
          Icons.music_note,
          color: Colors.white,
        ),
      ),
    );
  }
}

class PlayerButtonIcons extends StatelessWidget {
  final icon;
  const PlayerButtonIcons({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 2, color: Colors.white)),
      child: Icon(icon),
    );
  }
}
/*
Shade 1- 0xFF290542
Shade 2- 0xFF230438
Shade 3- 0xFF480975
Shade 4- 0xFF0CABA8
Shade 5- 0xFF0FC2C0
*/
