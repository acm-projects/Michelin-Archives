// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          ScanCheckPage(),
        ]),
      ),
    );
  }
}

class ScanCheckPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 390,
          height: 844,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: AssetImage('images/green_pattern.png'),
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(side: BorderSide(width: 1)),
            shadows: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 86,
                child: Container(
                  width: 395,
                  height: 758,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          ////USER'S SCANNED DOC GOES HERE
                          NetworkImage("https://via.placeholder.com/395x758"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 18,
                top: 644,
                child: Container(
                  width: 353,
                  height: 132,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/brown_pattern.png'),
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 5),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 117,
                top: 697,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 7, left: 19, right: 11, bottom: 9),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Color(0xFFAAB977),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 125,
                          child: Text(
                            'Yes, continue!',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color(0xFFFFF6EF),
                              fontSize: 17,
                              fontFamily: 'Georgia',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: -29,
                top: 0,
                child: Container(
                  width: 424,
                  height: 86,
                  decoration: BoxDecoration(
                    color: Color(0xFFBC9573),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: -29,
                top: 0,
                child: Container(
                  width: 424,
                  height: 86,
                  decoration: BoxDecoration(
                    color: Color(0xFFBC9573),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 23,
                top: 23,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/icons8-back-40.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 329,
                top: 102,
                child: Container(
                  width: 42,
                  height: 42,
                  child: Stack(children: []),
                ),
              ),
              Positioned(
                left: 88,
                top: 662,
                child: SizedBox(
                  width: 213,
                  height: 33,
                  child: Text(
                    'Looking delicious?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFFF6EF),
                      fontSize: 22,
                      fontFamily: 'Georgia',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 151,
                top: 745,
                child: GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    width: 87,
                    height: 33,
                    child: Text(
                      'No, retake',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFFFF6EF),
                        fontSize: 14,
                        fontFamily: 'Georgia',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 170,
                top: 36,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/brown_logo.png"),
                          fit: BoxFit.scaleDown)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
